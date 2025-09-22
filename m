Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A898CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrglqygU28IwGKhRkuJiVgnOhi1QWBZjpMckQhkutCU=; b=aUO/jwbfBnvdOBc5MeuBbm4p3y
	fuW1AydiFIcs2B8IdR0WrxCSytwcVH+Ugzo+f1iNB4yQbG9p3Z+LSOk3i/Ke4sgaGpmb8M7Y++Okn
	rcaFkBSUMoQ42zgNqQbTJ9aM+Z63jOzULxKHZBQwvI9COJrcNwM8zfIi2fxUrwAXWbqw+Shv1B5Je
	LpRz4MOnLJjbxdVpg1sfxqEoFetJELIwwBRmoTXaNpUclysHUltNEbqAjkomlWxHLFV1h9NtCzhuf
	P96vvJ9GXSHHoTtt+/Dfqx7gNWJn5B7LKGPbbW+/f4X2EFZUKPdhwqOrm3LctmOEiMIyZpDna5wpB
	wkWFqjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kKI-0000000B7DA-1Z5r;
	Mon, 22 Sep 2025 17:27:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kKF-0000000B7CD-0UR3;
	Mon, 22 Sep 2025 17:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 949894322E;
	Mon, 22 Sep 2025 17:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1A3C4CEF0;
	Mon, 22 Sep 2025 17:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562062;
	bh=LgvstVAhZFC9XhxzN9f9868XJZhXwPjlACehXJwu3Ow=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Lwy686eAmRzFn9wVoSkxBMfVS0wTWyDxiuIfRayw8WHPEqgHVdzudSv/T7EHkf+mT
	 OUnV7UYLzVxuGZFdDO8Nhm7lLnR3Cv2Hdo18GaZh1LuODRyO6BWqkB2XWrdLx/fQ0e
	 zmELoJT7yq+iTEcmun9sALqa5iSEmoYG0uJRifsQ3ZhQVU8TE3tCtqGtqoyVPP7Kun
	 TmVitBC7BgB1AdwawbPKSOIK/4D/VVh10OW9Q6C12gDVjZdWmdpADxup6wDYEEAjbN
	 KgnB984+8t3Y8gJTYzSNQLfxNmZEDYr/b7ZHnOGvDhmETbpYSo32r1Wxy47IX+f8ZH
	 SjjU6G5H9g8kA==
Date: Mon, 22 Sep 2025 12:27:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, John Crispin <john@phrozen.org>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250920091230.17702-1-ansuelsmth@gmail.com>
References: <20250920091230.17702-1-ansuelsmth@gmail.com>
Message-Id: <175856183533.499759.5488159366911717626.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_102743_175559_35899B59 
X-CRM114-Status: GOOD (  12.69  )
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


On Sat, 20 Sep 2025 11:12:28 +0200, Christian Marangi wrote:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
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
 Base: tags/v6.17-rc5-999-g7ca61ed8b3f3 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/airoha/' for 20250920091230.17702-1-ansuelsmth@gmail.com:

arch/arm64/boot/dts/airoha/an7583-evb.dtb: opp-table-cpu-smcc (operating-points-v2): $nodename:0: 'opp-table-cpu-smcc' does not match '^opp-table(-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/airoha/an7583-evb.dtb: opp-table-cpu-smcc (operating-points-v2): Unevaluated properties are not allowed ('opp0', 'opp1', 'opp10', 'opp11', 'opp12', 'opp13', 'opp14', 'opp2', 'opp3', 'opp4', 'opp5', 'opp6', 'opp7', 'opp8', 'opp9' were unexpected)
	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
arch/arm64/boot/dts/airoha/an7583-evb.dtb: crypto@1e004000 (inside-secure,safexcel-eip93ies): compatible: 'oneOf' conditional failed, one must be fixed:
	['inside-secure,safexcel-eip93ies'] is too short
	'airoha,en7581-eip93' was expected
	'inside-secure,safexcel-eip93ies' should not be valid under {}
	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel-eip93.yaml#






