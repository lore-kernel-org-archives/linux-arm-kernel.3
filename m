Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E995606A339
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zTlMWSOU;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=diRYCfoo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TqEzG2GL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=; b=zTlMWSOUjCl/RB+ANxg/3xdEsW
	MVAby7nU05rrjnyau+aemMPTwW6tpZyyJVflNhRpDs0ayhj7S678xoq++d6pV8ZF2t1JDYKlIZuJ4
	8RTSs+8Ah40n0BPatdd/kZQxCPdIz1GspB7AQPz14L2Kl5opv2hJLoRS1DeKbU/XgeDsI3GH4Qsl9
	fYeZ1wnSQip7afJYq1oWwVhJtO+dZF3gvIZn3iyWzsN1hc/3PLAk+Pt+5hEYYEzRyL1aEyc2eY94r
	OCULLwxmi3OCuLzu0s8nydKOdZgDS2+srrG2NooecNFIwObdFTTeADtAsWjGGg1oZ6ehqKqoBn8fQ
	Pw8uU/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWJ-0000000Fksn-3smA;
	Mon, 02 Nov 2026 07:31:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmWG-0000000Fks0-36mZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:31:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vU652716020
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 07:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gYG4XMvbj1ZWlrawZXHMxE
	dbu1VimdUzwJ1tmM4hs3E=; b=diRYCfooBoVtpAs2qY12b7ltUtbQPn7fSCax3u
	Blu3jzb/hThurIkvgQbJ8s2KvJp+yaYq0dciWduGOJok4jPKhx9wTbEmtaw6vc8r
	vp3aVZFZ8dkjZnHdlNYB4BAsLW+FjNcqtLapWiucCLhb5qUfmXL0LLushSYQG1WI
	eQsQv07I/cPryAOqYlB128d3afdJGWJClMxzZxj+7t/oG/6gzOnNj9t1Hnl4Eka+
	ZHCEis2sCglWM7XfeaUfoSuuOtBKf9oFd++7NLiTIUlf7VO1ZwAHQTIX2v8InQW1
	jdinYSNwfXKyaW606soMde4jK6hAFRsA8BUA5c4YNVpuZvYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2wq9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 07:31:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so2701455a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604711; x=1794209511; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=;
        b=TqEzG2GLSeGOaNM7t1t31mbpyCpRmIz3EAURYVyoPkjyBMvgfA0jqf2xjHQPwCS5lX
         IlW5G58fhE8ew/UqnFamV4oGjknDiRDEV9hmuurw1iNdU01uwE3Ie7s5hyUqE3Dwjl0k
         AvFjFP5LNr4O9KPUpStQA4W2fkV7GaUOa5sYur8bNy3sJkSoieRPwYR334J7Tf4mFSXo
         TdMFwJNIoDO0SFTssCmeUzu7yGTPdyWYqUv43IessGCZE3EI8w7V4HiblC167Zyp75PO
         qokaiOruNf6SaC7HYcGuAKomo9bFCa7SNGg0p9tdQTyBnrZ37lvMMVE4/o7W2/0l3y4N
         xI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604711; x=1794209511;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gYG4XMvbj1ZWlrawZXHMxEdbu1VimdUzwJ1tmM4hs3E=;
        b=fV6xdpOFZQR7Ff3Gg/1Yo71DfTzG7sRwkegAH1u4aoWvkxNrOyivwF5zXUqWb+RRbr
         BBnY8SkZ3B+HqxL87gWr20a4vGBxWnnsAvBEQhDNfmNMdfKybNgiFIQXA/SwAhFN/0+7
         in4JFrsfuhfSGv3ih4m0IKdE3WZjwTZ7scXV+jZZ9GiZSoc1bBpWSzS/C3f6iy5BXpFb
         78qmpFcU5sUtScZz0xLnbToe6b/1b8RkUTHaExPdQ0V1/ZPOZxB4OE4UpHU+FOQ+OUPQ
         5FO08V62s3GC5xdoZfh0o12p5qQxrJ9zsus9uBeasY5JXLSNu3P+SQu/7Li6cK/yCF+e
         lqXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzgrahtBd1XP8NX0sTDQmy5Bc32G60pQuthaqK0YCpYAtDlmxKLNRW1SQkHJVPIdiTxKnDEzGk+YwRZvTTUdBU@lists.infradead.org
X-Gm-Message-State: APuU4Z9uJunMqjUDSRvqCh9t9/djnxuUqZliiQigJh/el3LHFk0I1oET
	iwWqPT5qV3lo+vmskVBFGQEb8fqodOxti4zOmHniQLmnajfI1yU8EMaOiCcLyp28iOtWn89e50R
	L+JOQ9d4Y+i2X1YXjzOsaXthgq2DVIiKOcXOi0qpvtc8Lv1qEGCcSemrwFDSCScDWqm1L+LvcjN
	k24w==
X-Gm-Gg: AYBFou0v0I/vUl8ZARsPu77Si4fAGySk0Y6avueo2qqYvmf6V07Fv9besGQ5SbJ0Lne
	ZkBZMA6phTDA2cnkC9uHaBBGpKKgSRpUn3a0xwy2slT+NeWMlnw98FyNbYD7dCVFyD+A51JHep6
	4ry9w1aq88uMmcHeP1er4K7SUhIYsuhtq0hNS+StZhL2Qg/9jE/NqmoZxjgrz645HvTcm6mWNet
	0sLRwMd1bOUil8QomyIACEc8XvEZY9t64kwpdpNH04JsT4dJTzpHi6cI21mzzKLi56Fq7zIMicF
	5Bh90FLQ9ThpRtD4UNEsm25LemLZH7WSW6+TlU835n8XacwieEfotfKVfCKRvgVnVUDf0EA0lo3
	nXpg2RKxJzimiJweTV3Nvesfj3inUzsYvfFJE0EzSRmE8cte21o0xrE8BwKzFcYEY29ktWCKGiU
	3mkt/Y
X-Received: by 2002:a17:90b:4b09:b0:3ac:8354:3920 with SMTP id 98e67ed59e1d1-3ae6f054f7fmr8783993a91.56.1793604710284;
        Sun, 01 Nov 2026 23:31:50 -0800 (PST)
X-Received: by 2002:a17:90b:4b09:b0:3ac:8354:3920 with SMTP id 98e67ed59e1d1-3ae6f054f7fmr8783962a91.56.1793604709712;
        Sun, 01 Nov 2026 23:31:49 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:31:49 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Subject: [PATCH v3 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Date: Mon, 02 Nov 2026 13:01:30 +0530
Message-Id: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQ86GoC/32Ry2rDMBBFfyVoXQU9rFcopf9RshhLcqrGjh1LN
 g0h/14pzqJQNwgEI4ZzZq6uKPox+Ih2mysa/Rxi6E+54C8bZD/hdPA4uFwjRpikhBrcXkbALsS
 hhQuehphGDx0e+pgwq6SQTGowhKEMGEbfhO87/GO/1HGqv7xNhVg6PkNM/Xi522da+h4iRp+JZ
 ooJFlpYAG6sU/a9j3F7nqC1fddt84WKb2a/iJw8JbJMNETybBaGG7ZCvC0rjP485ZjSshfqfIx
 wj2m3eX0Mr3CCto+L0M/Hgp95NkihGydAeWvMH8NbSWQNl7NIRlJq8azy7jqDKqN0bSptZEPXQ
 TVEj8tLSLtN5WsmtKxdRVzNlFPKWlErVlkwXEvviFXUCf7PBFQ+FjoM2LZH3OQMYk7QQfLlM/J
 R1gAxIidoV+bZ324/azJchWoCAAA=
X-Change-ID: 20261019-lyra-display-upstream-post-24656268a902
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=5137;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=GMe2uwE7NM1n2Zpjzvl6iZ1PqmO1uEJHc9EkSAQxCso=;
 b=AtNy9jTEPlt0ZECo0G1l/73bQ9myKQpqhrq5hzh3Z1Y535V6i+Gb6kLY9MIl3HJMH7H40fIB7
 wHr8RWyWUjeDEfFHk3CwlyrqBQwjl2zhdKDDiRhPSoOTiKzelT6u/nk
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: SS2nI2Y6eGFGT9WzwZEon9ZgbP2rbfdZ
X-Proofpoint-ORIG-GUID: SS2nI2Y6eGFGT9WzwZEon9ZgbP2rbfdZ
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae83c67 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=BLctq3pD1h73di9K4sgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX2JMoeTxUIr3E
 VwRTU7L/SALuLfnA5Ryvmfskt6rktxYj7ItGb5DBTw5mgyLSY12cWW8+pVTQvw6tOVwJrckgbJT
 aGf7ywEzHaehxHOcfUK55Z+t1k36dJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX7RF8HQGMjtr8
 KfhT09l7dRzGH8sJDNqqWjHDJYeO8zPJYG0ee/BVGthWfoOatmSvH5Icn5OSf5uS9HXq30SKh6K
 lUCCI0bhAbgItdJ5zo7W+pPOJYZl1eaQXZDr/gqK1kNbkMs1Q5IN2yW3GNpa+P3NfjdGoH/rtLz
 SQ7mUslrZVAdWxzB9Jx90LLZVvTgBO6mt+Q46CONO/HsxqYZVY3sznMrcRKYDcgEnl2Un9865zI
 Xf65tU/RrLg4JjqUNoXTdW3/qMklKPDmVVsuULSYgzLeoON5NJs0tBJcUt7wv0OkvSCHYY7ethP
 Gfx+Svd9FL5GFjt9Vv9n9I8VU8Ik1VOuecjQJlQyhkigU4wi3ZGFVmHkPGkJXiu5D+2w9j4bdnq
 1+ao/2oLwSspF/MNSmaOS5FLXHSgLUc94THj4V46HuCJClGqEN0tAU4GNAYo9wCGsi2GkD81SRV
 DXgNJDay175ehCaM1Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_233152_790355_28636498 
X-CRM114-Status: GOOD (  17.13  )
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

Qualcomm Talos Lyra EVK SoC card are mounted on the Lyra carrier card.
The DSI0 interface from SoC card is routed to either the 22-pin DSI
connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
connector, through a MUX which can be selected by a hardware DIP
switch. There are multiple daughter cards designed that can be
connected to this B2B connector.

The below B2B display interfaces are enabled by default in base DTB:
  - DSI-to-HDMI using the LT9611UXD daughter card

Below overlay DTs are added for additional display configurations:
  - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
    daughter card
  - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
    panel with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
    with touch via the 22-pin DSI connector for Lyra
  - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
    Lyra with LVDS daughter card

These overlays are applied on top of the corresponding base board
DTBs.
Link: https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com/

Dependencies:
https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
https://lore.kernel.org/all/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com/
https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/

DT bindings:
https://lore.kernel.org/all/20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com/

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
Changes in v3:
- Added GP CLK Frequency Dependencies
- Reorder the &tlmm pinctrl nodes in the LT9611UXD HDMI bridge patch
to ascending GPIO number.
- Link to v2: https://patch.msgid.link/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com

Changes in v2:
- Fold in the hdmi_connector port remote-endpoint indentation fix.
- Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
  patch; the dt-bindings dependency is now declared as a series
  prerequisite (see base-commit/prerequisite info below).
- Drop default-on from the DLC0697 backlight node.
- Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
  panel overlay to fix a dtbs_check "too short" binding failure.
- Reword the PWM_CLK defconfig commit message to name Qualcomm as
  the SoC vendor.
- Remove a stray blank line and non-ASCII characters from the AUO
  LVDS panel overlay.
- Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Anand Tiwari (2):
      arm64: defconfig: Enable PWM_CLK for backlight PWM support
      arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay

Mohit Dsor (1):
      arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support

Shashank Maurya (3):
      arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
      arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 101 ++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 493 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261019-lyra-display-upstream-post-24656268a902
prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c
prerequisite-message-id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
prerequisite-patch-id: 37995c88387ff54737dc82eb7c3b4600901ce061

Best regards,
--  
Anand Tiwari <anand.tiwari@oss.qualcomm.com>


