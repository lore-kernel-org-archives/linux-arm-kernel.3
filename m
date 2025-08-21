Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D18CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdnqRKQW0mfUUXDxeA4Dfhod2n2rYmTQJaDO80MGrqo=; b=TkOsIj+UVeGsavpSw5mYmko8MN
	OM35LkwoDn7k2Kf0/Ktc8M2CcbskjTOGMtBHAQbB0fX3kZgkzaVvYqG9TA2pkiGerj51gaGjpLYmm
	g1LRyZi3obcZBJxDJ9XnVy7sYUsbH2luFTRNkD9n6Wr4s1WqcoCV71GOeA1RHSHLWL3iIybGNl+JI
	lfVbOZBlDkjpN2mjE0HIHrEKFKluTFpEUAaCHozvFQQ0TdmXgNUBPMU+bi6U2VTzuFGYj6GY1lmnR
	7DILWnDzoMP1E3ODniOsJRiQywrS3ThrIbAsSLELoyU60ffkaJvkISVYV2VHS3kiMMNCwo4d28bk+
	/pfLPVjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKPg-00000001aqH-2VdU;
	Fri, 22 Aug 2025 05:34:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDwm-00000000p6I-2pQb;
	Thu, 21 Aug 2025 22:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E7C7408E1;
	Thu, 21 Aug 2025 22:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEC0C4CEEB;
	Thu, 21 Aug 2025 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755815991;
	bh=vuZhFVJxi98oZW9G4+46GRkaq4U3k45zs10DSDHFn2k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QB7tZjdvYg84DKSiyFtv3QG8PehyI3EomBo3qpPbXBg3avH2COX+5vcwJVq4K0EM4
	 1itP36tXMVtW/ALvIMSVpq8cDpVb/RFo6/3NcSsOVpnkZTLfvwSbf3oOgHQELjDKXw
	 YZKl56kdsVoRrdL+Z+s6weaNU5i0psZgmy2mdZ/0HJ9Vx1vsAbG58rnQg2SjpsLv4F
	 8rPB8pQICq1KDfP8D3L2GeW+gG9UQd3IqYQOHFqtIs/b85M0XstjATm3xQA6vympYZ
	 Jeg3COmMvyLyOF49z3CZiiKSwnRVXnPTkmP0YpCIQC+ZB8Pg3CyUV7HilsWOIJ9BPn
	 vmniA3eB5h5IA==
Date: Thu, 21 Aug 2025 17:39:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-usb@vger.kernel.org, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, Felipe Balbi <balbi@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-1-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-1-172beda182b8@kernel.org>
Message-Id: <175581575751.1136230.16771549350883688048.robh@kernel.org>
Subject: Re: [PATCH RFC 01/22] dt-bindings: usb: snps,dwc3: Allow multiple
 iommus
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_153952_943480_79F85C4D 
X-CRM114-Status: GOOD (  10.09  )
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


On Thu, 21 Aug 2025 15:38:53 +0000, Sven Peter wrote:
> Apple's dwc3 variant requires two iommus.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): usb@a600000:iommus: [[4294967295, 1856, 0]] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): usb@a600000: Unevaluated properties are not allowed ('iommus' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a6f8800 (qcom,sdm845-dwc3): usb@a600000: Unevaluated properties are not allowed ('iommus' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a600000 (snps,dwc3): iommus: [[4294967295, 1856, 0]] is too short
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: usb@a600000 (snps,dwc3): Unevaluated properties are not allowed ('iommus' was unexpected)
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250821-atcphy-6-17-v1-1-172beda182b8@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


