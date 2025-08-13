Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41008CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4Dgy8jq4R2IqnWuz1ndUSN51GAE4XrI97K/D4HrNy4=; b=dy5V+2ChZ7dssJqe0w+jXkwe5+
	70XNDACC6Qzj0LQaIvyBvfej3XAtKkW1QD0bgVBM+ZPBTXvs8yNb5L7DzEUahZ6uNuw1pLOK8JRM8
	XbOlx/G6veyaBJhCJ+qHIWURZVXwID6Gkr7OyE+/SQVpxraT+hyr0jx1En04Yvflyc7c59qAAFXZv
	IkF0b3XXTVQ23xHSDpArEmfZEc5rFCmCt2CvI77aU5Vi+O31zi2zgPraxymuAwRfqYHDRWzpqHan1
	JjNhT4cRiuteFP1n951ZXHFwMv9BJWTSjrrG5LZvF5XJwoHv7PSKCBs9jg/AfvJ472uMDu4z1n43u
	2sLS3YGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8zl-0000000DQCd-1Bu6;
	Wed, 13 Aug 2025 10:46:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um73f-0000000D8EL-2b82
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 08:42:09 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1E0A2346;
	Wed, 13 Aug 2025 10:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755074472;
	bh=Md87crP7XvrIg/32S+o/qDrdc4VwxcksNoXwwhiGwsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pIi2UAXc77OYxdCzuJVZEoMcuMzkf39RZGUsU40DeVBghp7VCoEc7LbqVhsaKcBMz
	 Ms3GxWk4hvXhWkKiaCMZGs5+1OmF9qv5vpbApxxLAZ9MZFdTrnSnYYymrC/8kL+yRb
	 QQ7kK/NO9iB7L3mnvwpmvDA84BEMtlPSs27evlT4=
Date: Wed, 13 Aug 2025 11:41:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Todor Tomov <todor.too@gmail.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v2 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
Message-ID: <20250813084146.GA6440@pendragon.ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
 <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
 <175506028291.2605875.11473205221167147078.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175506028291.2605875.11473205221167147078.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_014207_797773_6A79BA05 
X-CRM114-Status: GOOD (  21.76  )
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

On Tue, Aug 12, 2025 at 11:44:42PM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 13 Aug 2025 00:45:09 +0300, Laurent Pinchart wrote:
> > Usage of the clock-frequency property for camera sensors is discouraged
> > in favour of using assigned-clock-rates (and assigned-clock-parents
> > where needed). Mark the property as deprecated.
> > 
> > Update the examples accordingly. In DT examples where the sensor input
> > clock appears to come from a programmable clock generator, replace
> > clock-frequency by the assigned-clocks and assigned-clock-rates
> > properties. Otherwise, just drop clock-frequency.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Changes since v1:
> > 
> > - Adapt examples in bindings that reference sensors
> > ---
> >  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--
> >  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml  | 7 +++++--
> >  .../devicetree/bindings/media/i2c/ovti,ov02a10.yaml        | 3 +--
> >  .../devicetree/bindings/media/i2c/ovti,ov5645.yaml         | 6 +++++-
> >  .../devicetree/bindings/media/i2c/ovti,ov7251.yaml         | 6 +++++-
> >  .../devicetree/bindings/media/i2c/ovti,ov8856.yaml         | 3 +--
> >  .../devicetree/bindings/media/i2c/samsung,s5k5baf.yaml     | 6 +++++-
> >  .../devicetree/bindings/media/i2c/samsung,s5k6a3.yaml      | 6 +++++-
> >  .../devicetree/bindings/media/i2c/sony,imx290.yaml         | 5 +++--
> >  .../bindings/media/samsung,exynos4212-fimc-is.yaml         | 4 ++--
> >  Documentation/devicetree/bindings/media/samsung,fimc.yaml  | 3 ++-
> >  11 files changed, 38 insertions(+), 17 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'clocks' is a required property
> 	from schema $id: http://devicetree.org/schemas/media/i2c/samsung,s5k6a3.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'clocks' is a dependency of 'clock-names'
> 	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.example.dtb: image-sensor@10 (samsung,s5k6a3): 'anyOf' conditional failed, one must be fixed:
> 	'clocks' is a required property
> 	'#clock-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

This is what I get for relying blindly on CI :-/ Sorry about that, I'll
fix it (and try to fix CI too).

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250812214620.30425-2-laurent.pinchart@ideasonboard.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

-- 
Regards,

Laurent Pinchart

