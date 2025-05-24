Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79B5C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBhcpdutQdpsY2d4xSfdU+wiA0i1aCGhWvIByVmi7tA=; b=0bPLXPzWH+v/rPiEwR4vNW93jn
	oqaVpw5OHGTo0jCrUHi5JTRMydMoMyw4QI+RX8jROy85l4BxY6Ny+VoqsTLgElfVfYQyrsjQlPZHi
	6hB4IIXuzZxQfH0NT3q3AuwkZp46r4aspLTD4PPEW/qBZz3xMW14tQnJKQIC/HEbU02YQylya3Oxk
	QfJ0qZO7huzkXPBT0vGotT+yNtzp8hv1m8iqGTHZYVb4XG4UZjDcvBaOdkPWaf59ShPT3g/MXcSIu
	ZfJKM6xqb54EaZ5goWXNXnphyXlJ5iAKH66AKRW7UL5xX7k/yOxluM7MLN5aD9diftMAUKq2mMdvT
	FCKFoxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIp6U-00000005tLr-2JzM;
	Sat, 24 May 2025 13:39:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIp4K-00000005tE1-12fx;
	Sat, 24 May 2025 13:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58CDF44F00;
	Sat, 24 May 2025 13:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C23C4CEE4;
	Sat, 24 May 2025 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748093863;
	bh=Dy6g9iTJD8/sXEcSHCbtuzEf0zlqojTeZLePMYmRv+w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eOIIg87zh16DG5Ntu2dB+0edVj7Y2lCGJkJb5PPPgPxMknBBYeI/bGEcagqr2lCgr
	 M64M3gQLleXjic+p5O+b3eEmbIoapNkQLziZv4RN0U9kzMotl28HijCMHRYRJFdO57
	 a6f4PLTUdcu1GehK2z1NK/hsxdX5U88+UgMAXJeIAzgCnvygIzMZYGroaGJa3Aktln
	 8xtc1vwFlXb0FLf5+2tJp2W9AaF7KRWJz4R+usnWbM8399sg6wn3KW8kIT1oQcj4vs
	 g+wfQKDQHnOKclykBkDi/k245pxD4r/2eAr0fWYzWQRTzw97nSIvSGs+qcwLhl6pYy
	 DrKSNNenJ0PwA==
Date: Sat, 24 May 2025 08:37:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: teddy.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 yunkec@chromium.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org
To: Olivia Wen <olivia.wen@mediatek.com>
In-Reply-To: <20250524115144.3832748-2-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
 <20250524115144.3832748-2-olivia.wen@mediatek.com>
Message-Id: <174809386038.549652.1263468272508643617.robh@kernel.org>
Subject: Re: [PATCH v1 01/10] dt-bindings: media: Add MediaTek mt8188
 ImgSys components
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_063744_312337_D97FE5B1 
X-CRM114-Status: UNSURE (   9.18  )
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


On Sat, 24 May 2025 19:49:53 +0800, Olivia Wen wrote:
> Introduce more Image System (ImgSys) components present in MT8188.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
> ---
>  .../bindings/media/mediatek,imgsys.yaml       | 180 ++++++++++++++++++
>  1 file changed, 180 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,imgsys.example.dtb: imgsys-fw@15000000 (mediatek,mt8188-isp-imgsys): reg: [[0, 352321536], [0, 16384], [0, 352452608], [0, 65536], [0, 352583680], [0, 65536], [0, 358875136], [0, 65536], [0, 353370112], [0, 65536], [0, 353697792], [0, 65536], [0, 354484224], [0, 65536], [0, 357629952], [0, 65536], [0, 354418688], [0, 65536], [0, 357564416], [0, 65536], [0, 358612992], [0, 65536], [0, 354549760], [0, 256], [0, 355598336], [0, 65536], [0, 357695488], [0, 256], [0, 358744064], [0, 256], [0, 353435648], [0, 256], [0, 353566720], [0, 256]] is too long
	from schema $id: http://devicetree.org/schemas/media/mediatek,imgsys.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250524115144.3832748-2-olivia.wen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


