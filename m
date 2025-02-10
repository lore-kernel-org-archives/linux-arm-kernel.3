Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99036C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Kcu6XE1Pl2R37OZwgbkQSGdnaUlnMNddlRe2ugSH6Q=; b=K13XcUQu45po/kv0twSLMQ06zr
	H6gteSCKTsJ6XytFPeNtM8i0pTj1GMJ6cSZruDcL69hEBY9vOBY2Bk1nHYB5i0VW1NOqd2b/wgPlJ
	x6lfprOComCHQnZDgbmzVcWCyLfVokFAuqp54qa6gfbK5hs3TM1X/d1WiDAlPf7cW1Pxjr1X4mewL
	Zre2/SO7aCK89ulzkEn2smbZX2Oqa46BkCFRAmdxFF39IY/5iGan3jQE6Xyv4NITy/CE6VH13XiAV
	NI1mOjGKbFdlIMSSzxO4TvMFtS7CsH5YhjVL7GAjYCyvhArt9tjUS+7h5X8oRRQDGdScuvQEqmUXM
	fP3eHZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjM-0000000HN1b-1p8N;
	Mon, 10 Feb 2025 12:17:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thSYn-0000000HLWw-0OIG;
	Mon, 10 Feb 2025 12:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Kcu6XE1Pl2R37OZwgbkQSGdnaUlnMNddlRe2ugSH6Q=; b=s+Nok+jkiSksrF0Bg8qUzmTpKu
	xHzZe3Tay4sGEcE78uh5thldvZIPOOLd56Rf0IB8HIN8lwYbeMXvkDJqkkcibBnP6731vJffpPPU4
	Glmm4XjmZhBcaxLZBtm6CU0al0HDQ1DSlfWivGsUf0wqRX8zBkdUn+lfJQupDdGPisqD3/KKitJ+Z
	prM9X2NVoNJscwzMUO1srUEPptaktuLkdnSyDciNZuxrgi5PxBIIQca9S9A1yA5YoruhNCAjkpuY3
	6bQcMMIyEENL/8Rm3ZqytQoigwr0tPbFygC7YW96js1te25raJPaNpwA2m/QH8IJnx0UsnMHUUYbJ
	nvKBJ/OA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thSYJ-00025C-EW; Mon, 10 Feb 2025 13:06:15 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dragan Simic <dsimic@manjaro.org>,
 Maximilian Weigand <mweigand@mweigand.net>, Marek Kraus <gamiee@pine64.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on PineNote
Date: Mon, 10 Feb 2025 13:06:14 +0100
Message-ID: <2663295.taCxCBeP46@diego>
In-Reply-To: <87a29b78-5fab-48eb-9a86-f12c41369dfa@kernel.org>
References: <20250207111157.297276-1-didi.debian@cknow.org>
 <87a29b78-5fab-48eb-9a86-f12c41369dfa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_040645_138389_08FDE652 
X-CRM114-Status: GOOD (  12.12  )
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

Am Montag, 10. Februar 2025, 12:06:15 MEZ schrieb Krzysztof Kozlowski:
> On 07/02/2025 12:11, Diederik de Haas wrote:
> > Add the recommended chassis-type root node property so userspace can
> > request the form factor and adjust their behavior accordingly.
> > 
> > Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> > Link: https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node
> 
> Drop link, no need to point to source of every property. You don't do it
> for aliases, compatible, model etc, right?
> 
> With link dropped:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I've amended the patch [0] by dropping the Link and adding Krzysztof's
Reviewed-by.


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=for-next&id=aba881f30e0294a58c0cb076918d366e39801185



