Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFA9D5E36B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Wdep8RPIJhzasUweFFiPencut32kq2qM4uF0qs/pOY=; b=X2M12325k3FfUbgFvU92T1ZxQW
	kETzbbCBSLK3h5OS1B94Sh1Ud7ZnZSMVGTMq/9B+AHQyfB4CEE2rlmPtZcapxZsRXiKzntHp/F32m
	CLW63Q2JzoX2o5G8xe1cH7qg5B5o+cYO3FbUiRYhvDhC3PR3LRx1sm3CtPtfM+g771RkchPCZvqtW
	qV2yMjNyCxyBT90WiwsRr/trTpZ9lX/KQzraiBtP+JuuiAIquNEo6bA5FQQ4vUrlP3ZkKlx8O29Cf
	v9eAbSTa5eGxk5X55PCehjnLrDwMoZK8h80Iq1KIRxddHVQjxoL79yUpk8Kx2mp1u3KmYl5InfJ1j
	zHZROWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qNQ-0000000DpGp-3tyJ;
	Sat, 09 Nov 2024 18:40:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qBO-0000000Dnfv-2kPD;
	Sat, 09 Nov 2024 18:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Wdep8RPIJhzasUweFFiPencut32kq2qM4uF0qs/pOY=; b=agD5J8oxNzc4+u7EbHFk64lJ63
	oZEyLwJ/uYmZx77KJBxcyxE2TBAa3/4UEUPRRv1DSIwxamF5blvvUAkQWLspmH6qg6p0BvlSE8qLr
	AUKOhDD++hKdTgz73S7vNGy34dbRE0CmeDVRxtRhegNFXPWuhFHY3lfrWDWYzF9LOKAYebXIybtrd
	UScMtMK0CYFZg81lSaMMnC/jz6mPuYQcU1c5sr6kHlGeFJvKagwOCTQPbMB9MIzD440K7IvT3HMrv
	BBHO6+1PziSJwQQbyh8hLAQLb2mnF+l5pOffu2Zrnt+cjN2oEvp7CXeQOP08K8Iy7H7rz1lfpIGWM
	1YQfOp/w==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9qBH-0007Km-Kw; Sat, 09 Nov 2024 19:27:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alchark@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add OPP voltage ranges to RK3399 OP1 SoC dtsi
Date: Sat,  9 Nov 2024 19:27:12 +0100
Message-ID: <173117675956.1131306.6493161181935634177.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <dbee35c002bda99e44f8533623d94f202a60da95.1730881777.git.dsimic@manjaro.org>
References: <dbee35c002bda99e44f8533623d94f202a60da95.1730881777.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_102738_756229_23C1DA79 
X-CRM114-Status: GOOD (  12.09  )
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

On Wed, 6 Nov 2024 09:33:08 +0100, Dragan Simic wrote:
> Add support for voltage ranges to the CPU, GPU and DMC OPPs defined in the
> SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  This may be
> useful if there are any OP1-based boards whose associated voltage regulators
> are unable to deliver the exact voltages; otherwise, it causes no functional
> changes to the resulting OPP voltages at runtime.
> 
> These changes cannot cause stability issues or any kind of damage, because
> it's perfectly safe to use the highest voltage from an OPP group for each OPP
> in the same group.  The only possible negative effect of using higher voltages
> is wasted energy in form of some additionally generated heat.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add OPP voltage ranges to RK3399 OP1 SoC dtsi
      commit: 37e4ad9c795a725e7308089e9d59d094115138dc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

