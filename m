Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F99C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90fUXnWFtKyiLDqYvV0KbsKVcoKX5cNxRrzGBbt5u94=; b=lgWuOF5Yc0wlZmfEd/eqs2+Hz7
	iEzVqPdR6q4ZiKL0IBIwgLvUJhkYoK5Fs7R4IQX+dg+JeY6PBCQYAvlsy5Bf9txkV8wgocApPHEWR
	NrSeaNM6mHsDBJNyn1AT+CpNHjHobF0e0+XcudWN9dfhvCYjAwngYKNyz5gTeQXGrmJsTLcLIPjEP
	MsX2jDfVsV5W4qBhwniSPiq+Og8Zz7ntr8C214XBJqJFxPIkBNZ+UMnwUnrzdK8C3ZKgsKuv3Z3/e
	XDMh6THN8dEUcIVNR5s5JcPMYxy3aXfjbifRuTmtnyd1TNctNeoO8085hzT3c1YYisq+zTEP44Aed
	la71bOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASGc-0000000FQPn-18DR;
	Sat, 26 Sep 2026 13:16:38 +0000
Received: from npq-west1-cluster1-host3-snip4-7.eps.apple.com ([57.103.65.90] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASGM-0000000FQ6A-1elW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 13:16:23 +0000
Received: from outbound.mr.icloud.com (unknown [100.84.212.99])
	by p00-icloudmta-junk-forwarder-us-west-1a-1 (Postfix) with ESMTPS id 112091800A0C;
	Sat, 26 Sep 2026 13:16:20 +0000 (UTC)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPS id 0C1581800577;
	Sat, 26 Sep 2026 13:16:15 +0000 (UTC)
X-ICL-RepId: 01a0dddb-f8cc-7e5f-99bf-d17fb9d1118d
X-Suspected-Spam: true
X-ICL-Out-Info: HUtFB0MEWwJACUgHTUQeDxhcEV4JVgdeUEoRQ1APXxxCCkAdXwJFAUAZHVdQRARUBUpWUC1eCF4fTBwdDlgGEhZdRVoOWwRHFBcbXAAXGVFNCE4TBVIHXU1WDUcPWB5cFBcVQUNeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQJJC04eDEEPHwYLVQZAUghXElxOUl4BXwoVeRFQAVgeVl5aF15TFx9LAFxFWg5bBEcU
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790428579; x=1793020579; bh=90fUXnWFtKyiLDqYvV0KbsKVcoKX5cNxRrzGBbt5u94=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=IsJzXab213i6IiHHieBcpyOYHWoyIvDU/ZdrjLzeM8vrl/XGpO4m1D9QIVG/2G074kjJ3M14SwduArAiA2MJZmZCl1jPj31YMgcSzWsic8VewHrPkfx1X8i0k0QeXefGfzrmDl5PUDfGrcnTnO8tvmVxTrmp4G1/Tiraj2WEYPrtmMz0dBycuVddBomO+K5GvppvuBwDCf23FjYAppDaIAU/sKehMYk5BQGnx8UlsaCD+siSHQ5uV1ACK+tBvzXXmgxzoGzFRlTOSF3vv03NNwKEvIhPCdQYH8G4T6jaAsSXgRKPvsLtet0Jfo76LIkkkgiZ8QuIM7LCgOeTCUfWhA==
Received: from [127.0.0.1] (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-2 (Postfix) with ESMTPSA id A982418019F8;
	Sat, 26 Sep 2026 13:16:12 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Sat, 26 Sep 2026 15:14:44 +0200
Subject: [PATCH v2 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-avd-v2-5-ecebe6a3648e@icloud.com>
References: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
In-Reply-To: <20260926-avd-v2-0-ecebe6a3648e@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX4PaFlmqGUDMR
 ufrErjjQCKKM/HeeMNSKiGN4QBYeKInhy+bNestIByEhkVAlvXy8TwFj8zta9cdjHJCyadHHzxe
 iPb7spyLEzsr8h6zqkOW8VoEkfJpDLGug6u4/VTd0ZxznVGNOUCNyUVG2Vmnj923XqR+Dx+5UbP
 DXr9SVCu2FdSBf70C5sG/YAW7FbDie9px8S43IboRr1hVYk/byxUeSeK9Dlof+3h/4eQvXMtzZh
 Xi9EEaHX4N7MBecfJMsMM7FEpx/vgJDMDKZD2tFHwl2Koz7Q/i3AodynEpghX8UgTYrHszt4xUA
 CRAw88dXUXy9c/1hSHl5C71k9yFOFqBR27laM3TsMg3o81xURir/iXh2Jy6QbI=
X-Proofpoint-GUID: _sisFxW1BdTC8yqFvybzBvhTDbll3t_x
X-Proofpoint-ORIG-GUID: _sisFxW1BdTC8yqFvybzBvhTDbll3t_x
X-Authority-Info-Out: v=2.4 cv=NdbrFmD4 c=1 sm=1 tr=0 ts=6ab7c5a1
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=OaKxQxXMZlgjpfzMgsEA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABA88e6q8f1yJH/V9Srs61NOj8Fm4WD4AlunTVYyflrFTpon4RSkNB69PYR8wQvwEmBFrrwjltM6Fmhwvjetj2RNyFoTCU95pgN7vNUmrBxZQ2/cUqp/jOxCfokkWKE5uonUPUKn9HVIrEXXHSaX07RKVtrgJkKyo/ljkcVOQrT7kqYvI5K21GFrI9dNkd4P0UuheyjXS5EZIE5EOiBgJRbkpXadiIsFijV1Z48vLkvOYmAhZxlaCxUA9oN7sUrN++JU2FzeCiXMe7193dfvD5OvuIK8N5Kr6HYnPFLwEbR/k6LuwLfjVj1DhoQdPmeEUj1qbNX1NYc1IJ9FElOwVSMitQhCxDvPqjEbRc79BzUV82jbD6e5+i4V8UQT0Eta6Ria/+4/Wz2eywT8k1KB/dDpGcIewXKHVVySuHvkq3V5zjRFVCBfdpK79mS03CNjHm5UVmgLemMt51ICTW0WwrpbYOevXbmkurkKMgovhw+KjWve2tOdTmeINlSCDMcLCDyyHBiQsgFD+wondDq0pvyOtKQm7eJtKYm9aoDPICjdU20+9vJcD7V25etM8i52ZHRCDiXcpoXR1CPX/vy4OD8k+vL+9zZZOFySeLJGK4lFjl8IzkMnSCw5ZYKyQeq6GYPfzlHMdDatuogJOJ44Jfj7O0qv3PZk9baWKCo65/vcyo3Cx4jTdND+mTy0QXDSoOVSCu8xvMYwaW3+Qv9COztYjXjuz9bmpcqee1jM5cg0IQTi+k3cGdt8GV7xd+HO2XPBSTXcMt2Pf1yW7/+CbnCdFVyK8etiWUvE0gJA3ECViyjd9pZfgG+KT3cN3yjE+QUqVMsmOFMzrcX6WgR7EihbKx4H067J9GwWruozRwQxmtbzUoDUdr0Dxq8ZxOL5PSxSAzX+BxrU2vOuFDNUk6RAKCeWsyBfaW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_061622_504403_C65ADFDB 
X-CRM114-Status: GOOD (  11.05  )
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

Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c3e7262ba4d3..39f7cd9b0a2d 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
 	 * According to the spec, tile_cols_log2 shall be less than or equal
 	 * to 6.
 	 */
-	if (frame->tile_cols_log2 > 6)
+	if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
 		return -EINVAL;
 
 	if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)

-- 
2.55.0


