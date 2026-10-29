Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A9660A3809
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=14WmwNOD;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WySbZcI+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZvXpsBA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=; b=14WmwNODxQofyD
	i2pChSfGkGrfn1Jk4gle0JBPk3590R5lQfJwCaLgT2xatCNNcwBLpWkV9n9eNPoHZrm6MLumhkSBu
	A12WTyoLKq0a3d2A8XfVysEyMwOnb5DHdhzYRXS2mEuH12TeMB+Ee/jmQbLBjz7NWg6XkP5RRUoNw
	qsR29nfYjOlWLE1D9Z1PAf181HXrmYSDYlze4liDXoChGyiuCtRXktChZXmAK7/pg/TywtIZrJlHe
	LEfCDNn9fYGLqAB+TAnKHD3r1a+O0b2eA/s/7CwnZnfr3fz0VUCzXU2sQgS/zGv4aeusPSOKnCi3o
	8C+CoFLIL3zBK1+Sek2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM1Q-00000008n2Z-38a0;
	Thu, 29 Oct 2026 09:02:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMM1O-00000008n0x-2ILd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:02:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vUxw179454
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=; b=WySbZcI+8afrzpQk
	ML1Y7Q7bN5nEfvXGA+Jj9n5kryGtvJzhklTEoJVHe9P3fQDJ7mfXqurHBecdUlbH
	D+k5LTwoBKvoxsmkU5GB46KyyPJJO/M3ojDgXutVYOZoB2YHNk+9nmGpRstkV1uK
	GMd2sS3+bz2POenyn4tgd0abhzKcwZYnRWcwL7iBToTEMF5ong3kIRi6GsjIq0Jy
	71lUD9JiNcV+Id8yAU4cwEcsdY33BV0ipLrjcJhVppUQrJLH7UEUzvdV06jvBwGT
	EG8i9WuymuT2CS5nUdSPVg9HrROSD/EItOcs9SLfpx8BrrIxGGoexZy8dEoWP8qX
	5KJf8A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2rn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:02:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so1454780a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264524; x=1793869324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
        b=aZvXpsBA/BptnyPegciislgaYJgW1R34YSBzU34Z5EcnkwoW9jvkiJa1kfiyeVAbeS
         TnDySRWbou2FTntdpcFOSHErF3BkKOY8w9y2q1P/DltxbEeazl0bUtRsSXhRob0R+UlE
         qhzSiPPQo3WmieRM6GFI7YKLjFo/yC+/ePFuNUu+qHse01dKLybiUBSzrFdbJMGMB7gk
         fTh/DbN9tjbcriapmSDB/gCEydpDham5wgSPvLiqmhKnX5WuUX1pWIG2mmZw/BAHmErp
         FvA497zA0QxpzuawP2+owrOJqdysLgm+8KGe7W1aq+ccsI26WfvwP5M3F/ZoUlWefYgk
         nfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264524; x=1793869324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaegZ9+Myhai8ugI7bQJbLZnEb4ZbtFQqLe5y8eXwqc=;
        b=1tppxF963TAKEPYsQgW/y5JURFztj4vjTIM6N+gzIcxKiGykD7m8sfuqEi1VNuIjfm
         5dH9AbWtXmc6q0UIrF/PFtDrL9G3I2LJt68sT7QFQD6jY4MIEM3rJRJ6AlU29RMGkDPO
         b4r/pdEQTNlgU4rjwPFrVZXflpbPG/PrG32RWsYDU4ZTGyJc0Ek42qT0jCN47Js+xgWN
         b3Gq2vyahUuJPpdc7VF4on8IrGsZqC7cXM7CyGUgsgvGI+2uU+n+qBZxwX9S283sIAmN
         99Vhd3FvSbDi+QmGbxUAEObHrCY1FCzARbo9uvkZseV1kRjk8OV0VY7NdIxbHadpQ96S
         49+g==
X-Forwarded-Encrypted: i=1; AKwUvByTHdtxbkoHt6lU4aHH+awTht+1jw0LzBmRIQtOfuXe4vVpQ71aAGc9Y3yf2JEYdDMLDeT9BLBCh9Ve8pZCe+q8@lists.infradead.org
X-Gm-Message-State: AFq9FYIS/IzFzQg92x9ltkwi6dHY7Z2iATfWVS8fNaSs6OhvdkUTDhLf
	Hjuxhfw0E0ZCDWl2gmKXypKFwcZUx/jU9fphJ7GpNiehwtN/8kIQmylzMko9+ARfur0Ainv6Pb6
	uCmDVzs/NuL0NXb8n5JNfnEHDV52Exensg+GKyyMMefA2w0vWKZ9Acs+opejoxngNe1E2gAeG/y
	dNlQ==
X-Gm-Gg: AYBFou15xv6ttR1EoKkUb9jI+JRMI6nmZ4ZMqyac64o9E29betY0Ekiwc1Eox8FJMPr
	ozcqSeJ5eAnkiJqlYpyMmczvD0GC0Lg0HE9KN3II/gWfMJ9ycJ4vMJf8tbYQIk9VF4Iyuk+9YSy
	SHHzfuxIBv1eXcZR7/wc2qMSPErbFisarPQcdzPHwDYN5d1sUUDJsjAd7QxO0mwUjqFSB/erBFW
	QwAOyAKmqdMlEBG1lo1yaDyhltKPE95CtfhNF4b5up//dKN0OsVchqIU02nBZo/8EQ5F/ijQuDg
	Zz2O39k0jqPNJDAeqp8ISMvhk7wer0c/d9PEfwy2/b3Ma3MKV4OEcXn3aowsM8TOWQlKZT0hjyv
	CUFc0eUTsCCf8gbfMmjJER+vECJPxv2DORSOhIju1Zh551vbkptB3XTXvFnXGgTtXfi9e5gYeYv
	ailIc0nB2c
X-Received: by 2002:a17:90b:5386:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae5825051fmr3869157a91.46.1793264523867;
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5386:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ae5825051fmr3869128a91.46.1793264523384;
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ad710sm3197385a91.3.2026.10.29.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:02:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:30:59 +0530
Subject: [PATCH v27 05/10] dt-bindings: arm: Document reboot mode magic
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-arm-psci-system_reset2-vendor-reboots-v27-5-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793264458; l=3109;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Cocw8yqxYsC8f+LcKoCIzML/tmVX3vxCTN78aew4Vgg=;
 b=CndWAYSCONDUqL9nIiAiDUAvZM2ja3u7IKu76ZeNE5zbHXufpIJ6xe2m/zsaMxyDqVINOzfbE
 TQ6JqtfIfTAB32c1gOkFYjPzY3i2fxEW1DztsF9Q+t+7i/D9Ommnj0f
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30b8d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZjyxHfqtAiH8XHGUigUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _LpXLnJoCcMUaQuJRotpjrpfqUVGJoW8
X-Proofpoint-ORIG-GUID: _LpXLnJoCcMUaQuJRotpjrpfqUVGJoW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX1Vk0hNI0V3eQ
 8lfQQ0ItiRkilgOsMyP+EWzaEeOqSRz6FxJQCZHf80wZB8BGzQAwLh4IEyOpwgzUvn9aEkyR69L
 I5MTtienwtfZdfz0yFYHBdjjHnmUBNH2Lm28cuqijZAKlvoU/lto0d4x0EQfE7MfVfvqg5JaJ9w
 fBjydGd7bCvXuTFB2Gh+7tEsy+VBnIED1VcJajurZS2ZrMVXrPBZ1wLUS92Xi89NZJtjWznZ0GR
 Wm7ENNAXh/Erf9A6qoJhtq8pUAIf04jZOrUm4/zp/0+oFLA6C81kLQ/pN2QBzwHzErL17LFr2IQ
 rdebPqKbTMMvK/awk+SkJ4CyApVrRkeMwhgrc2yNWMMK+Bi5Taqy8hnvckWvLflIaknnubJeJ3H
 tr19QZnH3J3iyLPtd6ZZ/MZuIT67uk9NhIzjIzDcT5l7BiI9iCaoonU6yHVZiu5AcA3vTfBt4ZU
 m2GoOtC3Ot+2ipQblTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXxNSf1CwXgZDS
 TU3Ye6A7T1aOSOl6f0jE6ejGwAWUk7Jh6JTUFzWenbnPskffLEHg3LG4GxH/Oq/aZUFZsJWu2vT
 rJ57gi3vCa7v7gkFT0TkSBAenLQw/9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_020206_957573_D9E3210C 
X-CRM114-Status: GOOD (  15.95  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..82ae25e7a338 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,39 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +170,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +302,18 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1


