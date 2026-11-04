Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B1606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HoXh+i4u;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NhFvWHcZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UFMzItU9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=; b=HoXh+i4uPaMnkx
	qQ4TR+YPIXYvYBR2NIa3JZZ59FaFPyTUL6rVsluihmtD0gHJ/lUtQjLHVgNM5yWvynre6a594NU6T
	34CEC09J9wEKobBo+bV4beAGu1YGNkiwVg/CWvFlQN2k+P8M5hrLzkPE92z2dAm7q9hRWLNX6JKI/
	lT1PQe84ASAoDmk5ovVFyu0jf3Ps4I0jYn0HjMa+a3VRO2HioU1jNK467lx3wntmKIbROH8BEOaHA
	gNdRhbgISyUIdp1Jw/XWwC08IGT5s3bNj4gzceeKoStc8U45uk7gYYFsHS3+u5SNLmt8JQHBYWSkN
	CJoSJSXyo9PbGBZ+tsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW5L-00000004f0Y-2Ebe;
	Wed, 04 Nov 2026 08:11:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW5I-00000004exp-3EIV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:11:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A476BZF3335472
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Nov 2026 08:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=; b=NhFvWHcZj6SlwuKd
	JvfrIHkJvs/z6RjfeDlllrPeTIs//bsd0MsKf8wOX3Hlk1iNWZOOR5bxMgPf9z7B
	TcrJVHeyrxt2fgdBcQGV95LtV0DKRYNu+RRF3MEuTiZcFXzCQYFwVws/kJE1jBRf
	Rd5SJ//knkFuC3DTF91/a4oJSOmCphZcYXcThugYmjx0avQSOpeM/Uxq5KxSBH5/
	vVEvXgvEE08W/qvlSq9EeK1gJudeAMw9RS3qICuZ3+0NRwsp3XIgDQXJ7IA8fI2u
	yAE6u2Z5zpoNiQ9QWkw61jnFAzIbQkwuG36a1gB0cPcHBLFuLywZKqQ6I2HLYcgt
	ZEJFJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbtxx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:11:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so579102a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779863; x=1794384663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=UFMzItU91HjjU/BriOi05Ryd5M3kZA4h6YfID8lB76XvmgvrWBB1KccrBGx26AVTwm
         QN6xkA7KzqkVcX2uNmhoACx1mPjjA3bU7seomjzGg8EJYUaTgUwgfKi1c7cJvbFsWXgz
         iepOA2jneYTndc//fMMihKhW0TjA8km1AvIESuXFm/pwkXYdWQjXcIcReqH6QQBYS39q
         +8OZYCmQfwl9mF8DhkAaCf1qNhOot5zXfX9AZugqUJ1CX9hPSQUx95JnIrXtsb8Hr9bi
         7AWVsCofEzphCAuiU4GVh2k09xL89+dzArwoRHSybwb1e+gPUVdp100GJhjxcNNovST1
         2Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779863; x=1794384663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy/GLms6jvtPYezR2cEZalh5ATbfeMN0GPB5R8gedCc=;
        b=SfanRlmV+IWk2gSmjq76iECie6/aemAAX4tPOmd6sMKyeXGVgxE4/iuuX+iG2v6HSA
         E+B6AOvDOsJ4trWifl9p54bzyXrbMvl1yDyp4JOn6ylknIxDRT7Is4PsZuGWXms210Vd
         VJ0srmbBOP7jU/6iF5W0rwgOFmQq3T+tGqgio9aWzYB5F4kSuVl5mLOxf2IxgdO9DHp2
         B9fsf7deJfXvC4Ft6opzPbxNLoLyytXtN/eEcTlKEGDPmmzm3XxZPfuZciwvP8bM715l
         61jz71elU9xYKqzZSCbq2HmnHWRNUXhGoZUOJUewSwSv3YctNE3mh0JytGDrv2AoEWc9
         eQxA==
X-Forwarded-Encrypted: i=1; AKwUvByB3ymEY+Fyt7PV3IA6NEkwgXiOIybT6YlPRmRNA4ct6gcdnYA9sIBlUHLWhYQ5Rk6s2CcEJOnGBJHHUGbz+bJE@lists.infradead.org
X-Gm-Message-State: APuU4Z+1BSRlPwpJRsoL/ptu5IkmpN9zMCjDhMpFJFe/RrQsk4/v9XIz
	YD7itCYLsAtfZ4PEhisqrrUN+FocChA0ag1CI6z0c12jiRvCGrxbVcIC8skXYBsZRpjrX6oQ94k
	t/ykk5zloNCGTPnC1IK7gq3IaHjGPbtlYauncOXu0q5LynRmJsfN3xc9phzpQhLjdSlRrj1mS78
	P6Ag==
X-Gm-Gg: AYBFou1I6UY4/XQrm+QqDRmXblyPAd5mbvPf0Pk2+zGDgKgxvwphX1a7Z3LYEcbN+Ch
	cLOR/FVyqoaZ3PLlkaz9wZqCMdY59XDuIwIT2cP4d7yKjEE3XPXUZzND77dT7H7ykANWDms9LXn
	uEQhzUDWhZ1GGM6CIP77oVJJG/1pKuqbnHZK3hI7UdKJtM+QWVYvCFE4WCq6dRy8Zx9XFjhVvR0
	I3J6ZoEJUj9nr7mBnU/SRblaP7UdRkKoCpU5ztZS6y8ogtTT+tDU4WpYg97BgRAwrqF+kEThskC
	6blMeal3jDJ6Ds/7zs2I1ZBhmOMlMiE1pOC/o+D9RW5ybGbo0bkJ2hewOfpSTPweRqq0J6wGWHS
	WqvpEOjA/JL2DXFAiAxQYu17V9eZIQUihWLvNgihj7zzXO8wHx5mgAFObXoHrz2ccoQIJp+tDWv
	EEtTLsCwCi2g==
X-Received: by 2002:a17:90a:dfc4:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3ae897994e9mr11683458a91.36.1793779862652;
        Wed, 04 Nov 2026 00:11:02 -0800 (PST)
X-Received: by 2002:a17:90a:dfc4:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3ae897994e9mr11683435a91.36.1793779862158;
        Wed, 04 Nov 2026 00:11:02 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:11:01 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 13:40:47 +0530
Subject: [PATCH v4 1/2] dt-bindings: regulator: rpi-panel-v2: Add
 vcc-supply property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-rpi_reg-v4-1-3578e794ff45@oss.qualcomm.com>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
In-Reply-To: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=1446;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=hqNneUV85ciDgNcaZNEAxA4akOO2zgiQecHtZF5ZtVY=;
 b=3GMekl2J1cqQKWD80nY5cUazbaoIRGsNILCjoSkD8xTX4crMZswNM+k2jKFr8kY6vEPA9fD+A
 2NxAWmSdpjFAaOknzezzUyWmmgnkozXO01JCWdexBNZUv4ZRcMJufqx
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-GUID: j1H_VGipCZB-jOiBEVG-Vd7J5wG_cVB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX+5GBdpcu6gl7
 Y9hZ2Pv2h6tbC49tWCckYg4zlVOHC2MEK1U3zjfx7mPAtynid63MbzH7B04rGuwaB6ZTHVrtOai
 HmEUSeUOeNBnOkioRhoxJ3986U8+ydOjgl0BG9LNOHV5Bij3UhFAqQBw4iDA6DcthJia8hiDR+w
 NmlaxIAyHLjw3SDkPVHZNl4U0ryjve1oB7dc+x2/L30GiqCaSfly0cCSmATff9PpfOAI2bz09h1
 9/fLXVGV+g4edleX+obsUCWdOyj/fbvc7UQj4JhTBZHN9+FTkXTBk3s0Pa6T3HMq3IsVVm38wrT
 0fW8nnpTfYQj2SPTq0zE9az7N1g4eM1xzJ4nArGlBz7MuGP2epCpCW5/uVGQNaUxD7HKppASnKb
 kFeqmPrA3GMYMIya1Fg3OboeL5ki9fLnNaK/bwognGoN957Nplf8VBv5joa046jxkvw6dGBALRH
 f6RXDmEz8rMrRtjlssQ==
X-Proofpoint-ORIG-GUID: j1H_VGipCZB-jOiBEVG-Vd7J5wG_cVB5
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeae897 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P5neLcC-yKLQ9RCq2NIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX1JnTRkX3iZnj
 5q4W20YB24VIJTRiXcmqJzfARhJilvcDVvFNrGmk04VAjnWwvpnR2ZBTQ33RnVKpICajH+zgraR
 6to0FEpawHQZltDN5OqfUmJVVTDuXpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_001104_941099_D5EF3CC5 
X-CRM114-Status: GOOD (  14.91  )
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

Add an optional vcc-supply property to the Raspberry Pi 7" touchscreen
panel V2 regulator binding. The panel controller MCU is powered from an
external power rail, which has to be supplied before any I2C
communication can take place.

The property is optional so that existing device trees which do not
describe the supply remain valid.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
index 37b9ed371b67..3e2cbcad6490 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -35,6 +35,9 @@ properties:
     const: 3
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  vcc-supply:
+    description: Regulator supplying power to the panel controller.
+
 additionalProperties: false
 
 required:
@@ -55,6 +58,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         #pwm-cells = <3>;
+        vcc-supply = <&vcc_reg>;
       };
     };
 

-- 
2.34.1


