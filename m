Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678DDC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 01:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVp+q0OXEFKzrgZ3sx/tEBHw0oQFJlRYZK/S98YsvoQ=; b=mPFz1Fnmmh5+TH01j8Heg5eSqk
	u/hhX2LC71QOJn3rvsfn1LjOaXM5kgU3yn7L1gwzgG5mKkoB1Lsu0nNf6qEpFVLwcP6RiH+RZlLwO
	FTN2B4sSRNO6JoLc2cgryHpgvYf8J3lCDZuvI1jWa2lHdJSRzNeFKhQ0MBKcole1PnoODhS66mcaH
	gNfjbNsaavSGPF2ZGIuy48KTZ19pb9ADfruVhC55GLf2KYBC3GoZ+EoHWvZZo3ZDhEJfgC83BwZNz
	xK6wjcK8zOVtkX1zEKC5RWQrZlktNOFHHOlkImzdl4fZ0Hn8CGtdnSN7XsRVZbQLmwut/hHe40uIZ
	J762pM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCEJ-00000001oKW-2BsO;
	Fri, 08 Aug 2025 01:49:11 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCBl-00000001o2L-1vj4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 01:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754617591;
	bh=yVp+q0OXEFKzrgZ3sx/tEBHw0oQFJlRYZK/S98YsvoQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hUqof9HbnGjzHizOMdz7dyj5F//rbpBuUZZzrwVb8zd823QbWdNCY2r0GbjAXV8Q0
	 ByI3u6/6ZvmCtcUTIltp0jeanALrnF5bYC3PHSYtQ8LNm/cRGRD/v0lwe9Plo18U3/
	 PTsElkZRTkzZWwEU6aewBeD4jJqO990eQUKZCkxYv7CepGBFq6KaN6svE2woaEae9g
	 1e6bqZHGQeRgaOSczGvPzVhow3jfDV+flGn0hHo97KicVebuOKBaIUF3ajZ9DlH3qm
	 YQmX4vdiKDzINFtflGxbHekmmAIv/+3mkKDVJS/W+a3np5EIjXa/k1WPzgYytYlCzK
	 PU+viEaUta1bQ==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8A4786AF39;
	Fri,  8 Aug 2025 09:46:30 +0800 (AWST)
Message-ID: <54e07d5e67b2d15810d79bc196e92c8bacabf789.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: mfd: aspeed-lpc: Add missing "clocks"
 property on lpc-snoop node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 08 Aug 2025 11:16:30 +0930
In-Reply-To: <20250807132909.3291770-1-robh@kernel.org>
References: <20250807132909.3291770-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_184633_686668_61765EE1 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 2025-08-07 at 08:29 -0500, Rob Herring (Arm) wrote:
> The ASpeed lpc-snoop nodes have a "clocks" property which isn't
> documented. It looks like all the LPC child devices have the same clock
> source. Perhaps it is the parent device that should have the clock, but
> it's too late for that. The driver for lpc-snoop requires a clock to be
> present.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob.

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

