Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3490DC71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 03:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qT86h424nYLdTAkOvz9ER5uOyajwYCePBdeQLxVucz8=; b=BpLMNLFjelJ58B2MpSQKL7RgAU
	/U2ZP8hsJqwgNe5RomoNPtu9N4ekZnZCedXjmUUXG0j+D3+v43v9kFXQcZT52gQNdhHZHKP/DCETT
	8Gy/VbyGmUQ3Bex8HMXcBko0hx/VdGNiRVqtRyRCxHTBdVtiGIGNW7O5YJxRGbCvazhr1Jke5016P
	l84RTiPjPkIirAaOZbXci+uTPjS3+VOfQjD6JtI+zZO6tz5yqNTgBSToGor5kN+YnBdpPBais2f1l
	zghuZYmy/d3qJhfRzIDnc8m3L3ubg5JvyeTlHIkcOUzttsCbarFSWJPEvgI7ykk8pxoZHGbGL3ZtM
	rdlCERhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjIL-00000008tUq-24gs;
	Wed, 18 Jun 2025 03:17:01 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjFS-00000008szR-3Ycr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 03:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750216441;
	bh=qT86h424nYLdTAkOvz9ER5uOyajwYCePBdeQLxVucz8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jR+YlHRqfz8YKs+mED5IYWbU351OPKnz7teywKpYcWH+65SpUb1gMqspwKGQ1bjk/
	 SacJf8XdpGfnd+N9l/OzTrEdG3j8geM9WU+7UF/RODEgfvdvPzTO5CbHeBpqCTAo3b
	 kVJgy9gR7HWRn3d8h5XJFrnkvGeOC3rTynsEFPX4ZzIspNhPVTdH6iUDnNX6KaSv7m
	 dgp2CzJx87nrFA+jcs023omehUCFnui5Djl/MTXAn6batm822RL23a54wtzGWD7A/Z
	 ekALwKYDeIuXBMcYTvUqCjPQxJwhERWfKKsvKIHl8LEfmQNzUUoRmQu7X9Rj8idKwF
	 8jWB4wjNvSodQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DFA7E640A0;
	Wed, 18 Jun 2025 11:13:59 +0800 (AWST)
Message-ID: <3fe67d60b145a1aaf1ceb19cc490d22c6aec27bd.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] arm: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marshall Zhan <Marshall_Zhan@wiwynn.com>, patrick@stwcx.xyz, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:43:59 +0930
In-Reply-To: <20250616091456.360388-1-Marshall_Zhan@wiwynn.com>
References: <20250616091456.360388-1-Marshall_Zhan@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_201403_073350_039D9D5E 
X-CRM114-Status: UNSURE (   5.94  )
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

On Mon, 2025-06-16 at 17:14 +0800, Marshall Zhan wrote:
> From: Marshall Zhan <marshall_zhan@wiwynn.com>

Can you please fix your setup to eliminate the From: line? It's your
own patch sent from your address, we shouldn't end up in this state.

Also, can you please capitalise 'ARM:' in the subject?

Andrew


