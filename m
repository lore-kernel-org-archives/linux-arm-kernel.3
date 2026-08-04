Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F530C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=E8MIedHUg+TNg+hjB2ZXdzwti6
	O/uQU1XeTPIR9Z1+HP6ELLuqRJofSVkcCLpaWriIaRQP/QUy/ckCp1Rd0eV/xqDGaMhltdnS0PjdP
	u+inMzi7c2eS8mdaiKcFUjvHkC+jnK71iEx/XEk9IhBeUrxZtfATkHngLSXUqrmYT854Sf20fwKdr
	6+4u+ogo55QUnVc9rx8cbGrSfAFpYwcAHcXQFI6diI5H0HamIi4sVP/a2QLR9kn+tJHR8FqhTIMYp
	XjlWpghnFhAKUkwT8htDj03eSk4o8PaBi4SEWrtL6lcVLitSZlkvmYN0bjA5etxa0dzH7qR5Aybtt
	YH0Ri1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJI3-00000002XEu-3TFY;
	Tue, 04 Aug 2026 17:50:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJI2-00000002XCz-0Wqe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Aug 2026 17:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=MxWifMXRanyRjQ4RJeArdZQCSu
	/ockmFxOQMcFmNiBu377jAoiVNM9qLGiVhY/k8QBhMBYjW7Al7AyHeMUEQlATniG6USadgnzzn7Ug
	yjhmPcF21Q54ev8IZDldKINbA6qrg1F113j1f5svdxyo+BMpS74txgPgg28i23N+SeaS0n1xGoKYq
	L9IRMOXwdclzSaf842mfDYUCR4qbq1e6IozR8vLBp83KnVSE0Mnhs3w0jAN6mx2kHN+GSw6ZediL+
	+MQzcmHEvCbwpkC8qw1D3dgI00ZnQCZozxC8PrFFlGAFQT286OtuoekL0VmTbgEtXZjw6P8qlido6
	z6zpyOJQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrJHy-0000000A8Yu-3PcG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:50:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674H0IiX580155
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 17:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=DHxsLfqdjvdMgVXa
	YmK4jdlhDcrc0L+8Q+HtCEOSh19NqDnTdQF0mPeunZtdn7bNW+g5/u8iM+yROZkx
	ZvQiu/0Et/0fZwmJnAEkbtowVB7WTX0ZoNR8yyD2KbofrcGy2CFg/tZ2mdfp0O92
	QPSuwOWHucgUF20Hov9wL3vAcITh1PLrNN9NWulKm4TrL5obijdn0H2IAtXSXS07
	qVS/0aII1AKut+2+jEsUhIXzPL1pDaJe1mPH5janKzWJ72M58Co9IJ4z3l0f2mVB
	7rkd4eEXyhvgKcJxk2HZFWZEPp9S8qu7XGx06GbS9Wq2g93oa3m3EzK7umIxDPcO
	mGK2PA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3q885k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 17:50:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca860baea9fso67670a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865846; x=1786470646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=GmZSIWbL4ErYCUm0EehAnnlu/1Cg7tUzmYpd3gvvsfsbk5jspYK9fFhu9gml4bD8HM
         5KR55WOE140TgF2zidSV249KkX8ms04DbyMSlGMVSXQ7/29licZGPk5VSZHaPPtBgexr
         3bTS8IiuoJNdKyDiixmrnVmVaTgr41FwXcEkfhfY3PyOdtk/wy+i/wVCJFmM6KTSmVH/
         HkYbgIuXYzccrfEhWoZyUMUM0/EzzoEt3kQM87T7UVws0TbRJY2yf7J9FQDG6mCvbVSI
         3L5BtpM/3ERGwx56eQ6/NDKPXXvMBe7w9M+01BVJKQcc9l1yjMX25KyWu5PAvp4J71nQ
         eihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865846; x=1786470646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=fanrRL09KOCLPomQoiDMDrK3SrgJS+Lh2yHTlcvoD7nWoKubgJXR4iYZFTm7qBKjkn
         L9mjIG5T33Knevmn8bWthlFiARk9eBvGFVOwz3SZ3E7EnwPaK63kgApEUo7VtBouKSQf
         aQkmQyk9ZzAkz2AkyGnf9gCqG313vlHqRIbVqZ+totr4JTF1MuYh6ynDHjh+2NNFhX9Y
         jW4JQk3ldxOqxD7Ea+U17Ilpg93CgtwFMv+//BpwqZmSYoAj9H+Tnf8z+PhAldM5SV/F
         GCqv89ruCPKahZQ3G1ETsu5jbaqmbkTducq0QmacRgC19LfM+3OHiTf8MyN7xMV79pmL
         s15w==
X-Forwarded-Encrypted: i=1; AHgh+RpulD0DDSaUkc5GjsNzZAl8yr9uC8kDwLReUrd6Y3ytvJu4h5sSRFGucVvzuUdB3I4MmtzYF2TPlz4ekiZbHR5w@lists.infradead.org
X-Gm-Message-State: AOJu0YySMlOsdnAf7stWrgjfpqxPFbQZVBlGNdkahwJQJ+Mtte54LDlD
	LQiF5l74gOPi+TsUKQAIw7PoRCDkgnF0A3HeBuu3lMGNHdyW7/d2AZbiuKyF1CgP9FKDlOkpTES
	yIQSJL5uDOTRBNrnisQRpfzWMUjdrcIgvTNrArPxh29JqHxHD1y9PH6e0ImlkYz/n173q/2+9jy
	JT0w==
X-Gm-Gg: AR+sD13bfhCRfIEMLn//rohzZ2uc3Jp6bE76Vb78CWnbWg3xqqKlppXK6kZNmMi6GMO
	qITUHnhKoUTRmEnNvbjnAy6mB5PmRQP99SrZ0mK6htpLguFFVGb0nluuk+ngNvmidmbLh2vuYKM
	jOnlkOoytfoBVdH0REEUO4RIqu00DJEGeePDN2djOnnSM0cOlpX3EBa2zRe/IwQUUIkTiPwm9YN
	FwoVwKYgV7q1xZOX66Y/GDADKZTxnuzFJxKNHM9ge7ax5cFnpyri+265vWDEo78h2dUum+IFzI1
	WkUQRWeXmU3tDQNMo1Dctlw6WvP+9gm85942/hVnOBWukLm3JuJB4FiAPbUppfc+KS1hjZZj5U+
	sZKx2Oj6ua7F9NPFAQOv3++g6
X-Received: by 2002:a05:6a20:7488:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cb85eb5c82mr580088637.30.1785865846416;
        Tue, 04 Aug 2026 10:50:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:7488:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3cb85eb5c82mr579974637.30.1785865845105;
        Tue, 04 Aug 2026 10:50:45 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:15 +0530
Subject: [PATCH v9 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-2-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX9XhRxu/vGg9a
 cFBlqPZZKu0WB924m+//0xSNRFhk4s7kD1q0WZ/IDCNbAE7joksF2eOBTqS00ONCqkN0YzckAn3
 9kCix7rDDUZLiSG93mNbIisX2Nt/V8HsO0/ezjt8EPC+RRltRZ2yAc5TQovbE0XEiPPzArd3a3J
 aQF7B0BsjRsZnLag8cXB6vd4ALvYKW6UP9Git+sMyorzm6XNvHNNGj+GwGE6MzOKR3FUTOgiUAK
 yud0jCh16y03GG5KdIAH20bpeyyVLRUhIAdmRlol8aiNB2dmgM+Za9KmW4rDuFusCb/p0VI5Zob
 oAo1fFhJGI4IBvAut8tayhA58X6kz2zpbfLpsAGorMqRjw8KTosHbCTlF1CbwfiqdB/JHhfpzem
 wfmUPICDDi7rG1EGnyF0oMH9f9/gOmUPSQ/Bt4UTutVAowEcatNqJYwoIINlEys+E/uNTkP9Bq3
 eSmvxoKPDQp/AaZ/U1w==
X-Proofpoint-GUID: JapHHD2SWEsjNucvpbUJxOolx8XEpS8y
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a722677 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: JapHHD2SWEsjNucvpbUJxOolx8XEpS8y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX+6nukaNEIwB7
 8Chj/emmKHEyq5mqhBxJfGKBP79qisDfkfx7qGZVn9SQa061dmoZobHdWhKJ4bdp6h8uQO6zuNG
 TMArGGBznyWxgwXTnSQrr1gUjqG40h4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_185055_556886_97A5680D 
X-CRM114-Status: GOOD (  13.35  )
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

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1


