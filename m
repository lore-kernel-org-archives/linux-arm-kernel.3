Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C5C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKLKcBiEShzPlf5+HCULNy1QOwSbwCZtyGIWTZnm9RI=; b=h/VkUD9is2oxWxhcJJ+4LSNOr/
	33tVohNq3nj/FxoKerHhpTVeqHwM11FeNF3Qnz+mHfYdlL/Z4/VDvV1ucKCoH5boiFaWQwmvgcdEs
	76fFRI/vHBjwiHiqCkLG4mxlISs9eZIsq3tW8DlNDZogJArYcrnVa/Vgym9yvJ1SEbvtJjUfs/NtI
	MuY3zgosYN1YueAkkhg+SGLPqbz6SmLtkEzWP1e7Df5C4Vv+sdbjjKnh1QxTS8ZCVOpPg3Cw/ZDmo
	w846Wz1FqJqojkkGODfqQ5j0QGx3SgGO5VX8hv/kS7+zlmla3bO6jciFjHfi3kwFc4n9LfMM5OCyv
	LXzAqyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazbo-0000000Cl0r-1pDD;
	Thu, 23 Jan 2025 15:59:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazaV-0000000CkT3-0eN9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:57:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D870BA40CFC;
	Thu, 23 Jan 2025 15:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98493C4CEDD;
	Thu, 23 Jan 2025 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737647865;
	bh=FPoRGmjzqY7kjf8l67wTrBxrM/eEufKrizteXMLv4GY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Hy7nN4an9w5o3Pqyq6XgPerIxU8Hi8BsS5sCvEn43s7ynDweBehaJ0OrAb3R6/buQ
	 cotaD55FR841DKPsdESrvLiCM684GA8yJJQF5uLPDe92QU5PY0OCtTtBiPMa8uOVMz
	 7+8H2z2S3PeNjhV3tbQxajkPpbjyaNo1PehJ0CGoTFU9Cnb9HMz0gdyFxw2k4lp+eC
	 lA4EHj6dEubqEB1SWZWmm+HSo0QUMDWhkg3n61UoPAFnLTOplTivfkvyvagd2wdd9f
	 qqyPErLlG90lDM9BxI+Uwog5b2m4wIpxhH6HxZl7L7oIdcBG5H1XC3FmDchBD2refL
	 sJFd7/t92yS7g==
Date: Thu, 23 Jan 2025 09:57:44 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: akapatra@quicinc.com, todor.too@gmail.com, krzk+dt@kernel.org, 
 catalin.marinas@arm.com, mchehab@kernel.org, devicetree@vger.kernel.org, 
 bryan.odonoghue@linaro.org, linux-kernel@vger.kernel.org, 
 cros-qcom-dts-watchers@chromium.org, hverkuil-cisco@xs4all.nl, 
 kernel@quicinc.com, conor+dt@kernel.org, rfoss@kernel.org, 
 konradybcio@kernel.org, will@kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, hariramp@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org
To: Vikram Sharma <quic_vikramsa@quicinc.com>
In-Reply-To: <20250121125010.1853269-1-quic_vikramsa@quicinc.com>
References: <20250121125010.1853269-1-quic_vikramsa@quicinc.com>
Message-Id: <173764774673.3793413.12753318541761077535.robh@kernel.org>
Subject: Re: [PATCH v11 0/2] media: qcom: camss: Add sc7280 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_075747_330062_13246960 
X-CRM114-Status: GOOD (  33.88  )
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


On Tue, 21 Jan 2025 18:20:08 +0530, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
> CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> This change is dependent on below series as we have updated clock names
> in yaml and driver.
> https://lore.kernel.org/linux-arm-msm/20250121120901.1841142-1-quic_vikramsa@quicinc.com/
> 
> We have tested this on qcs6490-rb3gen2-vision-mezzanine board having IMX577
> sensor.
> 
> Used following tools for the sanity check of these changes.
> 
> - make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
> qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
> - make DT_CHECKER_FLAGS=-m W=1
> DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
> - Smatch: make CHECK="smatch --full-path" M=drivers/media/platform/qcom/camss/
> - coccicheck : make coccicheck M=drivers/media/platform/qcom/camss/
> - make -j32 W=1
> - ./scripts/checkpatch.pl
> 
> Changes in V11:
> - Moved [PATCH v10 1/4] and [PATCH v10 2/4] as a separate series.
> - Marked dependency on
>   https://lore.kernel.org/linux-arm-msm/20250121120901.1841142-1-quic_vikramsa@quicinc.com/
> - Sorted the header files alphabetically in dtso.
> - Removed invalid property for sensor.
> - Removed rst-pin from default and suspend states of pinctrl. We have verified
>   that for imx412 sensor there are no SET_SYSTEM_SLEEP_PM_OPS added.
>   So removing rst-pin does not make any difference in power management.
> - Link to v10: https://lore.kernel.org/linux-arm-msm/20241217140656.965235-1-quic_vikramsa@quicinc.com/
> 
> Changes in V10:
> - Updated cover letter to add link for v8 under changes in v9.
> - No change in the patches w.r.t V9
> - Link to v9: https://lore.kernel.org/linux-arm-msm/20241217133955.946426-1-quic_vikramsa@quicinc.com/
> 
> Changes in V9:
> - Removed GCC_CAMERA_AHB_CLK as its always enabled.
> - Added GCC_CAMERA_SF_AXI_CLK.
> - Renamed gcc_cam_hf_axi to gcc_axi_hf.
> - V8 had 5 patches and V9 have 4 patches.
> - First 3 patches of V8 are already promoted to linux-next
> i.e
>   media: dt-bindings: Add qcom,sc7280-camss
>   media: qcom: camss: Sort camss version enums and compatible strings
>   media: qcom: camss: Add support for camss driver on sc7280
> - 2 new patches are added to handle new comments from Konrad on
>   "Patch v8 4/5 arm64: dts: qcom: sc7280: Add support for camss"
>   1 of the 2 new patches make changes in yaml and other one is making
>   change in camss driver to handle new comments in dtsi.
> - for "Patch v8 4/5 arm64: dts: qcom: sc7280: Add support for camss" I got
>   comments from Konrad to make changes for clock names so I had to make
>   respective changes in "bindings/media/qcom,sc7280-camss.yaml". As dtsi
>   changes are not merged yet, so there is no issues with backward
>   compatibility and I am assuming this should be acceptable.
> - Link to v8: https://lore.kernel.org/linux-arm-msm/20241206191900.2545069-1-quic_vikramsa@quicinc.com/
> 
> Changes in V8:
> - Changed node name from camss to isp.
> - Added QCOM_ICC_TAG_ACTIVE_ONLY and QCOM_ICC_TAG_ALWAYS tags for
>   interconnects.
> - Added blank lines when required.
> - Modified power-domain-names from horizontal to vertical list.
> - Sorted pinctrl nodes based on gpio index.
> - Link to v7: https://lore.kernel.org/linux-arm-msm/20241204100003.300123-1-quic_vikramsa@quicinc.com/
> 
> Changes in V7:
> - Changed unit address for camss in documention and dts.
> - Added avdd-supply and dvdd-supply for sensor.
> - Changed reg/clocks/interrupts name for vfe_lite and csid_lite.
> - Link to v6: https://lore.kernel.org/linux-arm-msm/20241127100421.3447601-1-quic_vikramsa@quicinc.com/
> 
> Changes in V6:
> - Changed order of properties in Documentation [PATCH 1/5].
> - Updated description for ports in Documentaion [PATCH 1/5].
> - Moved regulators from csid to csiphy [PATCH 3/5].
> - Link to v5: https://lore.kernel.org/linux-arm-msm/20241112173032.2740119-1-quic_vikramsa@quicinc.com/
> 
> Changes in V5:
> - Updated Commit text for [PATCH v5 1/6].
> - Moved reg after compatible string.
> - Renamed csi'x' clocks to vfe'x'_csid
> - Removed [PATCH v4 4/6] and raised a seprate series for this one.
> - Moved gpio states to mezzanine dtso.
> - Added more clock levels to address TPG related issues.
> - Renamed power-domains-names -> power-domain-names.
> - Link to v4: https://lore.kernel.org/linux-arm-msm/20241030105347.2117034-1-quic_vikramsa@quicinc.com/
> 
> Changes in V4:
> - V3 had 8 patches and V4 is reduced to 6.
> - Removed [Patch v3 2/8] as binding change is not required for dtso.
> - Removed [Patch v3 3/8] as the fix is already taken care in latest
>   kernel tip.
> - Updated alignment for dtsi and dt-bindings.
> - Adding qcs6490-rb3gen2-vision-mezzanine as overlay.
> - Link to v3: https://lore.kernel.org/linux-arm-msm/20241011140932.1744124-1-quic_vikramsa@quicinc.com/
> 
> Changes in V3:
> - Added missed subject line for cover letter of V2.
> - Updated Alignment, indentation and properties order.
> - edit commit text for [PATCH 02/10] and [PATCH 03/10].
> - Refactor camss_link_entities.
> - Removed camcc enablement changes as it already done.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com/
> 
> Changes in V2:
> - Improved indentation/formatting.
> - Removed _src clocks and misleading code comments.
> - Added name fields for power domains and csid register offset in DTSI.
> - Dropped minItems field from YAML file.
> - Listed changes in alphabetical order.
> - Updated description and commit text to reflect changes
> - Changed the compatible string from imx412 to imx577.
> - Added board-specific enablement changes in the newly created vision
>   board DTSI file.
> - Fixed bug encountered during testing.
> - Moved logically independent changes to a new/seprate patch.
> - Removed cci0 as no sensor is on this port and MCLK2, which was a
>   copy-paste error from the RB5 board reference.
> - Added power rails, referencing the RB5 board.
> - Discarded Patch 5/6 completely (not required).
> - Removed unused enums.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com/
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> 
> Vikram Sharma (2):
>   arm64: dts: qcom: sc7280: Add support for camss
>   arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision
>     mezzanine
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  93 +++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 178 ++++++++++++++++++
>  3 files changed, 275 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 
> --
> 2.25.1
> 
> 
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250121125010.1853269-1-quic_vikramsa@quicinc.com:

arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: isp@acb3000: clock-names:12: 'gcc_camera_ahb' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: isp@acb3000: clock-names:13: 'gcc_cam_hf_axi' was expected
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#






