Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BABCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSrgughWmHCMbvQQVln/YeRM+x1ol47uNfI7H84GJFQ=; b=C+M+PSLxV18sKB2fUPm4OExxWq
	2PfZt/MR5IpuC29sivP5PJJvBb1Uru3ZRmmjAFVnHnYeLAjETlP/QwerOqfzREONy2brcDbKNAJKB
	UdUz74FYpwCv8/kQiaQdbVEa7sA0Cv7UrfLDGW4O+dYf4QVaW4gGx9uOkkvky171GV6h6Zl4Bf9sL
	KY5v0ou/YVp5tCPwi4TujpeWKnnkej1r99b4vK0IgyqqZhcOYsJJnX9qHKgrbrrsB36rKK3bD2SBM
	rvSJxeI5UXZXxafnzuelP9qVSHRIvSHRlupgrCpWiGXFW9gxjMhVKbwzyG/uWLgKRYo9hnVZlfgYQ
	0vYRZNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNy-00000001ZrK-3MFH;
	Tue, 02 Sep 2025 19:09:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQtM-0000000Ha1c-3afp;
	Tue, 02 Sep 2025 13:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E2A24013C;
	Tue,  2 Sep 2025 13:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C79C4CEED;
	Tue,  2 Sep 2025 13:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819064;
	bh=apcyxtU2BfTEuwGJmPoxK78BUoU73MBDkSB83mC20sg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Uz/OlBgaC+w8NLJANKHBevuL6qZ7J/gpSGqFeotyS0j8p+uDqeRN4BsE9mlCitLgG
	 Xntog9q3fPpgv6iRy4weq0Vrm+NnPlyUGLZNptlMXkCSnVhKo2G4X20HgM52juBxIt
	 ZSUhuBTReMUoYMVDVbk20iealcBE654OjiGMnuWnEFIiM/qQ6DupXP9/3z79RMQezA
	 L7+eWIhTg8MfKFl9zNNRzjsgwur1UtZh2zG+yZJDGUzg0pyXSTKjvDM5oBCW7BZ83P
	 UwxrLfzzVTVCWLbsRG7iZrjtFVrREIIZgC0zSyeMR8H3tXA+XADufJGkDm0j8tVBeA
	 4MZ80CAzs2RCw==
Date: Tue, 02 Sep 2025 08:17:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>, linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
To: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250830115135.3549305-1-christianshewitt@gmail.com>
References: <20250830115135.3549305-1-christianshewitt@gmail.com>
Message-Id: <175678730682.877806.14001841198578934927.robh@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: add GPU powerdomain, opps,
 and cooling to rk3328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061744_938050_9AD6DE7F 
X-CRM114-Status: GOOD (  17.15  )
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


On Sat, 30 Aug 2025 11:51:34 +0000, Christian Hewitt wrote:
> From: Alex Bee <knaerzche@gmail.com>
> 
> Add GPU powerdomain, opp-table, and cooling map nodes for the Mali
> GPU on the RK3328 SoC. Opp-table frequencies are sourced from the
> Rockchip Linux v4.4 vendor kernel while voltages have been derived
> from practical use and support work: keeping voltage above 1075mV
> and disabling the 500MHz opp-point avoids instability and crashes.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> These changes have been in-use with Armbian and LibreELEC for many
> years without issue. Investigations into crashing (esp. with rkvdec
> running) have led to voltage tweaks and dropping 500MHz. Changes
> cannot be justified in technical detail, but are field proven over
> a large number of users, boards, and cheap power supplies.
> 
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 +++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250829 (best guess, 2/4 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250830115135.3549305-1-christianshewitt@gmail.com:

arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c-plus.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c-plus.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-evb.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: gpu-opp-table (operating-points-v2): $nodename:0: 'gpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: gpu-opp-table (operating-points-v2): Unevaluated properties are not allowed ('opp-200000000', 'opp-300000000', 'opp-400000000', 'opp-500000000' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#






