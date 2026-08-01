Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014A7C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6swns0hMo=; b=yVXyGZvaq7wRAIsZ0lB7utjT0A
	UbtaVvvKvOstTIV4Alr1526414ZIeCX6D+ZAPPixPhtsYZ4W7tbah4YuEDAP6agHqqg87OvcI6K39
	s5bsfYldO5I60JjH2ziPkaeND+Pk/KM1URsBDrXmlc2wYZJToIHOcuZzoTm2fXS0Kg5PFWuv84mxt
	HQ3/YWWraVZiPa7it5neuheWjHbJEUVcKcGG827YqzX9nOnj5dVypxVbcNCx9+LaQMlukDW8YYMLU
	+7h4a/1QBbDNMs+2fWr4ghqczJniZdRvBQCqS8QEV/aedLNuFBg0FuR9pcJLkpQV2sYFv4fpv8Dkv
	wWbPtYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqy-0000000F45w-136G;
	Sat, 01 Aug 2026 21:02:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGqu-0000000F43V-1ihn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:02:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxWYg3846598
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6
	swns0hMo=; b=XcOnXD0aWE+U2m8h96uJdzQgZsoQ34jeelAsgamdHqjo5HXNWyI
	We3O81eZilEYJRq4tcDTqzUCeEBsfVaUEoCosoIqekJc8dBMMHNYytQddYhnSGq7
	Ighg6aGwACCd1owRBXdKmQ/Z6Q4ejAFQkMaq7MJBUts5yz0bhzLHEd3nHut5gvZP
	xC1IgVOIOP4V4ZCABoAyfCyeDL6t9Z/SZDC+4HDWJnXydXZWLPCmVZ+8rbg6dBop
	Ce4eCBNR8PxSdN5UuYbhUpsx8zqMhZ4mf8ECqzTkPaLjrsKQkvT4dENAnIrtdNZE
	5BSlrE7XWNhLcq7XrtlX1hy9ScHeFpe6JsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vt9rmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:02:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso21543021cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618159; x=1786222959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6swns0hMo=;
        b=Bk1zvnw9bBULR005Wn5x5TzhK7euQoXBl/LYnsSmTQhMTbObbRfKvqnV2CKOW+hetL
         38J19TaCG7E39RAmkRLCiiuFjM/2PrwZtFN9O+NTm5Gfar5ejP8frc63tf28yslKlHru
         MHHc0xmwq9MqPWIyxz2stT9MtGwekLLF1mM4qmeWZGwg1UoADtDg/7CJZvPa8ldp3+NH
         VRPTR/4hXQmiLoNPqtAM3DZoqXYUS00MEzGS+u062aBWyZXrHe4G+ENvxcNr7BbKlyUw
         KNEDSi+q+bCl2vZDcMxlFUl8tWL62kdcRNJhBpCGCMuzOPG8k1fnTrjs4PivKh5P07hh
         DpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618159; x=1786222959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvoNAler0X3wq2mlOQgrHmi1cMsKgQHTCb6swns0hMo=;
        b=qCE6sflJTC9LhkOfOnEzUDtR1ZorQ2wGP7UoVUe2SGOup5aIx01J/h4CO4iYt0cSRz
         TJYahZvKSXsDJENXG4K/Mb7xf81NJ26+jSQ96LyF87J0fGTyQDTfqA/g7Cd83SXn1iGO
         08XkrBekWMqjkWFbk/Va1X2LfkwMIb6z96e6ikigyf1Z+0Klq1EIbe0JnN0IfSvlfZwe
         HWIHE23T43cRk4JL8nRItRZMJrS5vrJvvdxXx1IgQz8xVAY28qpWrE9+tb3WrwoMDo0T
         xQ5WWorZceofpqFV34BQdy2urlCAmsB+xsfAqCIg53yLROSmk4L/5dhHro/bNCc8JFdc
         oaZw==
X-Forwarded-Encrypted: i=1; AHgh+RqYvGN9hc282B9Efno2PsRD7LH7zXEBvCagrHKG+McO5d46E9KBHcPQxraPn9TfvutmQtf/WwGVrUxl7wqgHtOY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+1/J5xHlKK51BR1l4K78sCxf7CUMoqlidZeB9psWFVl+gX236
	0eySX6RUiUINrsi3mEybTFTap7cPPqsiqe8ysdFCNpjwmw8y+KDzEBLBxiFLzfw5YmcYqaKqYNJ
	X/9vqgHuDkgk8/vjNO4qZUh98+nV2fD2Fse8TRfhAqy7pCF75S2ikLvPkiJZXL1udFvLG2TGIb5
	tRSA==
X-Gm-Gg: AR+sD12NmzzBlJac24q13swCEFrDHfO0IlsZGhquPIZ7qIx80vqIuU9yd5UCQEIdQpW
	0IGB4CQki7/48pPawEEJM+Mh9AwCt7flSEjd9V5IHw++DVNUHsmVcCRhS7RxmColSpQMIoDG4bt
	p2R+e88FSOMyCJWFEkl/lhJc5s5eCO/ey6dAW7H8fPVZaJlz7lDbn5chUqZVn3282LXwLRpNQf+
	7YGrkAi/GuVkYTF6dJqjitKvTZGW/x2KK9VzTGoa5AhGz/vjTNQxjKgqtQkx1EG+nQuOcbgN7/q
	LrjuGXaivLVEgCin89tHDgJYhtyTZJ2MmKJ6iCyH3s5p18DeGhI6quWYvc9z44oH98W2sH4otTk
	QdVBSVUD7KjXaswW3
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr99692541cf.24.1785618158851;
        Sat, 01 Aug 2026 14:02:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1927:b0:529:e058:d185 with SMTP id d75a77b69052e-52b56751886mr99692161cf.24.1785618158390;
        Sat, 01 Aug 2026 14:02:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b84fb2sm49521155e9.1.2026.08.01.14.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:02:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: mediatek: Correct white-space style
Date: Sat,  1 Aug 2026 23:02:31 +0200
Message-ID: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=o1wXDvo30FMDIMPKFAH3bsRXsfW4L+mbYBBq4b+PK1Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl7mYZf6UZdVCaz/eSojXugBcHrSXjG3JTpHk
 exuNJGcn/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5e5gAKCRDBN2bmhouD
 1/o6EACJ+qN/cwYVo9+E0SjCZfzo5XaJLke9pVQV204hf2VmfGNPeJz1dzkFBE+QJ6GvLZtAF+l
 pHDyNX2QzpDjgr7yUj+x2cFpGuarWwyM3ljcRpA2gvJ8owPxAQfEGJI97TiDoK+2yYfNxwNkqEE
 EciQnaW6yFeQs5FP8qVMO4kWQyQe2uFYL0buF+96Gbf1xE1eAZEC3DZXMOOzHnN8nFFHH1tIL2b
 j+AB5IoKy8dcrrzQAEvtpl6niljpg0/iGu1HfAM2ayuOur2gUgGyip3reyUAw30Zx1WEOtBsJef
 l5iBwFshLGv8ji9lzJ2fCVJNza9uBK30tpxZX2enL27ZssJH9k8v7mEhnfzZvl+/5vk7uiS+vPj
 tde7cj7kgY+ezYs2WTQwVI6pgXCUbq0MHrKTsPfHt2m2GRYVlU2xJ9roB7UA3uzLcVre73hUqXD
 /urJ2lsIycgTE7ZR8zXKjzs7weDXpOi91UK4cosYA2M+0Z+B4WP/UznfP+j3hZKdIAW3z7m84Kb
 PNV2RW8Db1pWtUGtSSzPz4O99Kl3YYKQnjAFjlDp5d05idlYK0czjWUvy6fY14tUTrgR02r40ib
 XXkjidRrLzjdcQycfcphIkOdPdm1/4GNTVkiZEc7441Yek8WZOVeJpxbBtz4tzXPSTO+fA/iToq Lh4O+0cPxavM1oA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX7W4wagJBRQnY
 7fIKCuN8mcsdr5aBAi8xYi3853CaWgEdJO5lQQkrD9gmNG947Uwp09JhjPzgy86hvxa0Gq+6zmd
 pfxHPPqWeIRDqU0W/8ZDMwjQq77gEvE=
X-Proofpoint-ORIG-GUID: M-SkbntZjudQM4R2DLuSUvXEO3xbYaZh
X-Proofpoint-GUID: M-SkbntZjudQM4R2DLuSUvXEO3xbYaZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXxqmqtXRzVQHD
 15sR8dXXOREz3Wdk89lw+xaNy44bDSgwob900AOxL+efzEIYYclF4yiWxLijslH6itnbAo1ePF8
 V4kx5JeRzJi5W6DBNyJJddvuejyMvFDu0G4ZEuPDkrzzWIt9ie8U7yGoAooACtuqpbuOBIOCwkY
 GvTSIofe9OAOkPdWGoO5NeuU2Jd5JObD/D+zzCLiKVm9EpPNXlivdKGVeXxJ1IxpBgffRG4TPgk
 nGA3qZmjy3gi17XbboUyOfDQkM9/5OwGprIQte2pcN4JG36HSGQU1X2/UXv1Gc9YbjLyAbHVCII
 uo7zgue26a2yEMhZnpPCdre3w1oixxK9LD/jo3kNP6YPZl7yUz7+jSycYJ23URi/ERfzs3PYFI9
 iuxu3hxIty1oGr+CT43DMuhAS3rHAc5N+v0fvpGrBbT8qw7j1JVYMK2FISRU2J9olH1jcCcuT+u
 OBlyCQDmFvddesy6yDg==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6e5eef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wb8IN-ZjwPUj9z7I0xAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140241_904318_BE07EB7C 
X-CRM114-Status: GOOD (  14.66  )
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

Correct a few white-space issues, like redundant space before final ';',
which will be flagged by dt-check-style ("redundant-whitespace"
warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi    | 2 +-
 arch/arm/boot/dts/mediatek/mt7629-rfb.dts | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index aa42377b47da..6e9ff0add169 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -1091,7 +1091,7 @@ pins-i2s1 {
 	key_pins_a: keys-alt-pins {
 		pins-keys {
 			pinmux = <MT7623_PIN_256_GPIO256_FUNC_GPIO256>,
-				 <MT7623_PIN_257_GPIO257_FUNC_GPIO257> ;
+				 <MT7623_PIN_257_GPIO257_FUNC_GPIO257>;
 			input-enable;
 		};
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt7629-rfb.dts b/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
index f24ebc20732a..71a8e8fe28c0 100644
--- a/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
+++ b/arch/arm/boot/dts/mediatek/mt7629-rfb.dts
@@ -220,21 +220,21 @@ mux {
 	uart0_pins: uart0-pins {
 		mux {
 			function = "uart";
-			groups = "uart0_txd_rxd" ;
+			groups = "uart0_txd_rxd";
 		};
 	};
 
 	uart1_pins: uart1-pins {
 		mux {
 			function = "uart";
-			groups = "uart1_0_tx_rx" ;
+			groups = "uart1_0_tx_rx";
 		};
 	};
 
 	uart2_pins: uart2-pins {
 		mux {
 			function = "uart";
-			groups = "uart2_0_txd_rxd" ;
+			groups = "uart2_0_txd_rxd";
 		};
 	};
 
-- 
2.53.0


