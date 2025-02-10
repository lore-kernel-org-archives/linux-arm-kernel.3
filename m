Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F1CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIq2Le2HWe7jkjLDLqp05Yofv2eXi3L5LHVAsPz6mp8=; b=yuwykMlZxkrPr0QRV100yhSyQc
	l/h1aNBLelyjYwfX2gXtrce61/3fmLIFitrH4EBzyGy/XVmtdJ1kiOqhXFxpOkkFskEs2zpd5TOSC
	KTibIsGXYVdpVAioxlhbyz2tpB3PxJ2n7jCmAs19teMYTnbFIlnZuwGi9uqTIUGdri704+bCV5xzL
	F6GVMTNVVzE4vorE9oqVFgwQTDNEg0LuahVKnfHtdvkYLiphU9Vx/n6EDi4PXISDDracbWLUkUmFe
	bmLZ5RVWekKo5AZcUS9x2GgS76r/T2Vcb6xarZHt885pb5ybCS+puRWu5vCAGbMcDSMTAXBp5dSIC
	wh7bTqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRSb-0000000H6ha-2B2u;
	Mon, 10 Feb 2025 10:56:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRCn-0000000H3Jt-10jN;
	Mon, 10 Feb 2025 10:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QIq2Le2HWe7jkjLDLqp05Yofv2eXi3L5LHVAsPz6mp8=; b=RaqmZiDn5Lv21QyKcP6BRxkGmA
	DwLhyaASPhpWQalL/Y8pZi4nQg0h3dIRu6dh4gD7xEh3s3/1GQFdVQTWlCnz/zr2+aLgCgTVfSjik
	R4ubbnR9KGcovs4WHLneRry1vensJtxIGGxVHE11sMI7+KsBSUfgRUsLs9dshwvn/2BfnkKK6pzmu
	Lyu6SP0R1nghz+4IhEpmdvkycuI3TrzxZocxK/ctHE6PggDQhSntAp7h7WJB0sHRfPAGzo74vnJ3G
	efy693e9fGx8sgUtjnNqYXVnTzD2Xnukv2ZOpkLD1L8hs18JIXmOCN2+Mgu9nSzwZtYUV83UwZ9sd
	4JiBdvjw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRCc-0000xs-Fl; Mon, 10 Feb 2025 11:39:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Marek Kraus <gamiee@pine64.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on PineNote
Date: Mon, 10 Feb 2025 11:39:34 +0100
Message-ID: <173918381708.1055685.11966646265812211443.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250207111157.297276-1-didi.debian@cknow.org>
References: <20250207111157.297276-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_023957_278777_FA97DB8B 
X-CRM114-Status: UNSURE (   9.24  )
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


On Fri, 07 Feb 2025 12:11:39 +0100, Diederik de Haas wrote:
> Add the recommended chassis-type root node property so userspace can
> request the form factor and adjust their behavior accordingly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: add 'chassis-type' property on PineNote
      commit: 18cb5cb58f4fcbd96d00e1d882e6b5882d1b272f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

