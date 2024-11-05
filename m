Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929EED2B950
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PI7z63OR91PlrcEz1o6lgZvcp/UHgdtNFWgUjX44diU=; b=A5w8Ay807tj34V3ZLj22gm/xrh
	Q/f5GIZcWbTQIvYEP+7um/zWmrEB3GIEr4psTZDwxfXSb10L7VOHKuuVKzcfo1h395vX1NhnNm0Lk
	zJcnRQH5twGFZZ5C9JbMGDLxQts0I5vS7RsYZYzXijV/YL+65Hx15eR8+IR65ckfzYmN3t4P9uEcL
	3WwXoVntmgYI5R+yhO7ZjctL/s3oowV4t7PJOMeIzL7tqlYP0fK4W4WrsmMajWDkg7O/s+C8rudZZ
	A9ctozBdv8KlmGZP4rhTItDcaYeW9jdKxAD5/nzfv/xy1/ZaZFNY9+FujYLtXixQHNkktWuXwRNhG
	ktj2kTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LlF-0000000HTSy-2RTR;
	Tue, 05 Nov 2024 15:46:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KWW-0000000HGVc-23vG;
	Tue, 05 Nov 2024 14:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EE775C4C0E;
	Tue,  5 Nov 2024 14:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D3CC4CED0;
	Tue,  5 Nov 2024 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730816831;
	bh=H9lnLtemQ/eUrm6ZowUvs0U4ycXB0QN6ws8h/hIo9/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ogheu//NIDOF8rIG04kMJnc8LFupeuSjfNXm5VShLhda4WRd4NVbJXKt4bczFS3mj
	 FupDNUsOy7m41/xyyPuPM+vkL6JTwzVUmImMQWikHeQZaB0KRKZfEYuBJ4XicDAwAX
	 AsMigEk1+Q728CPS52aYB6Oc3b10XMSFg57tWEYwbpKq1PA1K5xdveK45YZ9C9O6FW
	 2owv2l+weBf2rBtzNawO1P737eFBC7v250BWjA1jaqbVThDaGiLsgGcT9FTNK6HMQp
	 TmyBka1xWcHVWrC72ot5uxqJYbB2xB+Y6GOiohoj5aM7IWH4/RHENfyLQ0/hcuU4AW
	 NAzSFvX/q1pvQ==
Date: Tue, 5 Nov 2024 08:27:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: dp: Reference common
 DAI properties
Message-ID: <173081682847.3210195.439507232582613661.robh@kernel.org>
References: <20241105090207.3892242-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105090207.3892242-1-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_062712_853738_D629DE69 
X-CRM114-Status: GOOD (  14.03  )
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


On Tue, 05 Nov 2024 17:00:28 +0800, Fei Shao wrote:
> The MediaTek DP hardware supports audio and exposes a DAI, so the
> '#sound-dai-cells' property is needed for describing the DAI links.
> 
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' to be
> used, and filter out non-DP compatibles as MediaTek eDP in the same
> binding doesn't support audio.
> 
> This fixes dtbs_check error:
>   '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
> Changes in v2:
> - reference to dai-common.yaml since the hardware exposes DAI
>   and update to `unevaluatedProperties: false`
> - update commit message
> 
>  .../display/mediatek/mediatek,dp.yaml         | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


