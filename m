Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6495CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxbrQgbI9Hp0lzSnXJ8VQEX0GBAeXjw4l4FNRJQO2nw=; b=aVEd1lMr93EgIkQM/u7bdLgYCE
	IgyzVkkPqGzbgLdxXElUxnakagU/AlMu/NjT/4Jmy2bwLDZDy0BdLylZiO9EiY/lpe2iTbVXdjhoD
	xWwRdW1Wlzwb6cCLAEQlAZfslGjpJhZEqNjOFZMlysGZe+X+9P+sHfsBjwUhgptF5tZJUDcGVcsRW
	zzV8MEtR/y8ll/gkMM2ULQxe+0Z7ursLUvDSWUTmknjBk9fHRrZqfJW+dXFghvx6xX77BNUM4ComT
	O4nyId47zbrTZnKIYwMbRc45Ot69QQNYNANZ/0pk/2feOEl01wHHSl6MkQm3IsXM2Ob5Q8MePIb/Q
	tDd/N0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDSc-000000078yZ-27FG;
	Tue, 24 Jun 2025 23:53:54 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDNb-000000078X9-1LPK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 23:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750808921;
	bh=AxbrQgbI9Hp0lzSnXJ8VQEX0GBAeXjw4l4FNRJQO2nw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NEm1SLbIZEjsx9Krx0+hgcKI6aHpzW9XZ4tgOiPgvSg+iO/oAYyxW7hL4fTTI7tPp
	 tH9Ks/nFlUv3hRMH/LxC2vD8ceGkBQwWMnvfBPB6tpZ6xAcfSxwdOGeCMmmMeCCYcx
	 I49F73Bthcw21cN1pswCmEh2Pio8p3xVy+YzI+oe1VyVpDr9UJ/38ws/CZi+Ss7kr0
	 Tpz2VzOe28Kwf3I9goMKhAEyrS/VqnTFBdVDwX1mrjNrukG/OqAUJd5T7xZVNz8ELH
	 S/ZdATsir6Szpk5H3p7Ye9WSWWpXurzJ2O+dwdGJm836rRne2aLBBxfrxMSsECZMRh
	 kCX1ENFJV+7GQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4057C640CD;
	Wed, 25 Jun 2025 07:48:40 +0800 (AWST)
Message-ID: <6a787dfc8bfdd56c564c4e2380ea7ca902bad090.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, Leo Wang
	 <leo.jt.wang@fii-foxconn.com>
Date: Wed, 25 Jun 2025 09:18:39 +0930
In-Reply-To: <20250623-add-support-for-meta-clemente-bmc-v3-2-c223ffcf46cf@fii-foxconn.com>
References: <20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com>
	 <20250623-add-support-for-meta-clemente-bmc-v3-2-c223ffcf46cf@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_164843_547762_8548AD90 
X-CRM114-Status: UNSURE (   8.21  )
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

On Mon, 2025-06-23 at 18:29 +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
>=20
> Add linux device tree entry for Meta Clemente compute-tray
> BMC using AST2600 SoC.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Sorry, I missed that there was a v3. I left some comments on v2 that
are still applicable on brief inspection:

https://lore.kernel.org/all/0f495eec39fd25d71a59a56876f6142e6fe786f3.camel@=
codeconstruct.com.au/

Andrew

