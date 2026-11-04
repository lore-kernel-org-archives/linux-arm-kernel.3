Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED71606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y0vYvZrR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BWQ/2s4s;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bsDKC9NN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=; b=y0vYvZrR95TLzqQrLiOKSuowBS
	l/706nRphWnyB8QiJHryzEwCtBQcR6kNn6axLD+/tUJrPqLBgtUI8szyAXUL8cruS0OElOnkqabUt
	FEPYeq0xCDXHoStiL0UyCH1esmcMhFneF5WUUJ+BJyyuIb1jRhBPcbs9Cl6kdPTNLI1T5lcyVjWdj
	2ilkXUdNK+NRJSi614s5ZO8pzRKXBuiZukl+6eObSNv7CMZc1ICy0JjzPUNdqDvAj1kKXSP6ltK3w
	0wF1HISvLJeoi4liFJ+jxXLPwIFxXHwZGWE7L2HU8wahGpgpfNfKi2AMMuDyUfcX7OsZrooKjnCI8
	cOqUmYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW5I-00000004ext-0xrJ;
	Wed, 04 Nov 2026 08:11:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOW5E-00000004evi-42aB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 08:11:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47BU7V809416
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Nov 2026 08:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wpjASZFX8c34eRfTv9obdd
	qQTOa+9xegFnCuM4xKtAk=; b=BWQ/2s4s+KWDyptBlco3xv/2WfNuaBYidH8YHv
	ZCrsG9i8r20T6JW773TwIS2iITemH3ME6CN9vaeC65OieUfE/Issdbsw/Qkp4zBS
	CItfAbgbnnsoPizoqxyQZXNZHvq5O/Xls/7PIjmFV9xJbekdcbtKLFpLIMc01+Li
	l+FyTTibKYCX7w4JMa1tSDqlysg5Ilipl3qmmZaBGXl3NAY3jxJMWeronlsgaOkj
	F50cNMiCUAPLZzNUD804LXbpWTZHLOXB0WIa3fBKkA/V+4iDNKwKJumqG8w/dzDI
	Gc+iyEmXQIVbSeEE2H6S36MBo1mORNHvJD8ldZ/h0TMQoktg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpbcrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:10:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so928424a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779858; x=1794384658; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=;
        b=bsDKC9NNH++/ysShRh8QqvFX5e/sQflTrjEqvS8R1ZyVVvANCSyjwB9XqOzo4BHgUP
         TQIYKx5g9ZkN4pYUsW9mNApVWiypnVczFL60FIfLxQ2dzY9xrzK0ntWD4VuxYcusdB/v
         1+Hh6ffFdOt7i+6IRLn8e2v15hOosCW4teBQ7pslF2aL5prbK+kxTlMpsP2y+5Qe+jHu
         RN27g67uDKpcOxGlliZAYYF3iOTBtemXzd2wwSq0n/xKIPSGvmId69Nh/tbn0Drnaaif
         uP/BRRFIxl3v1d2bdwvFuUpRVpsT3L+RjtOmv72dcBfw6nvv01/F7+th9tG+glxGOxBV
         86Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779858; x=1794384658;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wpjASZFX8c34eRfTv9obddqQTOa+9xegFnCuM4xKtAk=;
        b=dsLIYTOpJUr3/Cu2gaoBh5x84vj1JGYiuA9+KYyUa0g/dt5VntqOM5Jq7HunihVw2r
         khg2cF06Oa3RzXNxClWJzS9QLHF+T8hdpuxhsC7ugOR+fyZtCzpVzgjLssD/a8F8g7SF
         T3fRgx4QUkchx6EJkDxS0+hk6qV4MqTd8Z0ZFPnePxWlZqvvYo2NKzKsm26xUIJo9uv7
         8ibwPmjdYMXyNomNvw4xassB9+HhdJDrjD6rvt+KNIUQezrT43qm86dQWZsf7ZLJpkCk
         u/WzpMyYd/sUKpr1/jllOP8qu3TNibDeZ0nf50VjnaY6IPAsKcejk4/pE7+vxcX5tGvn
         lkLA==
X-Forwarded-Encrypted: i=1; AKwUvBz4cPsr+QIGtgYd8+8OpUyygVxSkejjxA24y7XU0KtTvoDLWtvhnLqBJafTUkQRMIBcrCzH50QRgfmgZTPUcJ4W@lists.infradead.org
X-Gm-Message-State: APuU4Z9yJX9pxcCgU9ku8V5oOMfFSzsm/W43XRwz4uKHdGIixBHmica6
	bC2Uw1dzwnzaBh50iOUxexHeLWrsoGt28CZtTQmNQZfuURZLxCiUkGyduQLDthWrr0VNE+J/EvU
	YEWPunvEwy4bW3MuqXoqYc3Ot1TBtuNCeq2oO8q491MYpIPW1ATKUlRNwEh87h+aE0wvPjwHxME
	1I8w==
X-Gm-Gg: AYBFou3OuDfa1cnJrtakxL8iMemKXmzjSEGgfiUoLhvPZkEEHVD3WkmT8iEcvCYDkLc
	dpQregL9rUIZqIz9c8DU5rJv5RGv5HXNgqm9tGLZjxdb0RQKSziHR9ykuZpI93ThiENQJdTPs2J
	jJsvsU+hoCC29u2502oZnA6zmAJ248SVriiuPZM8f4Ee6PKpniNApxAbgFP1O68JNJilaUDqlIy
	cAfnC0A7CGK9GdLyvFsP3sazJb/MLIv2ElJfk9r+ai3ARjkNxMKHX3ZONp1wEoXxKmtA27a4kV8
	8qwrJxnsqqrzEPNZDJ0tCXs9g14K7FYt6Q8eXegPwVS/D115eeOZr6hLaWVrJhyZxItU90sboRU
	09ZtVyhnrh8shzq+GhkwbFfbaGVCNCPF0dPpl80MyZRfH4ayrxZHBKS7Ko5NxEPFCP5DLB81Nyz
	MH9NsCoX+QNA==
X-Received: by 2002:a17:90b:28d0:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ae895743ddmr13951540a91.5.1793779857710;
        Wed, 04 Nov 2026 00:10:57 -0800 (PST)
X-Received: by 2002:a17:90b:28d0:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ae895743ddmr13951518a91.5.1793779857187;
        Wed, 04 Nov 2026 00:10:57 -0800 (PST)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm6089920a91.13.2026.11.04.00.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:10:56 -0800 (PST)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: [PATCH v4 0/2] regulator: rpi-panel-v2: Add vcc-supply
Date: Wed, 04 Nov 2026 13:40:46 +0530
Message-Id: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIbo6moC/22NzQ6CMBAGX4X0bMnSUn48+R7GGCiL1AjFFhoN4
 d1t8aCJXjaZZObbhVg0Ci3ZRwsx6JRVevCQ7iIiu2q4IFWNZ8KAZVBCTs2ozgYvtJBZUYiaCxQ
 18fZosFWPbel4erOd6yvKKeTB6JSdtHlurxwL3u+qYxQoSFFWVQYNT9qDtja+z9VN6r6P/SFh3
 PGvnLFPzn1esiTlLJEp5PAnX9f1BR9jGSD2AAAA
X-Change-ID: 20260907-rpi_reg-8c6885b35e5b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793779851; l=2273;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=TDZPbLRwPtzDhDZDJhYBIn/7Vqee9lBuOpCJiBezBFw=;
 b=bLOTJ/+GihrKe/nz6Kl9UqFPMs/Gyul5P9lFlVm6uUeFpi9zp+tlQZa8/Gc/o+/DuxwYbBPme
 f9sm8Vv0qTrCICNn3/M/aUeM+Hruo/rOaxS7/9Jq92wuJhi64lvt29u
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX093rB0GxUiro
 LjznABKzyTmrS7fZ4u9fdNSz0W5NUBIabrZUKeBJklzpx+1MUoeAKYTlKmCKW2JtvZH3gWPCGz5
 GDg3qMkYmJ01qHQuonPipQe4UP2njJq37YbkhlRHoy/78y4t96aJHJhnLmN7OUWJbo0stjBY3Pb
 Bzy87F8zdadlo5aXB0N3NTCcI7RMG4K6ChAYcmDjmhUH2qaYnpV5hp5/uHMjXruHKOT1a6O/hIp
 KJv6vEVwjSbLKChBmhDy9epMBC56pZ5GzmqZygzotIoBM19VU86doqW/tC3daVOuziUkE5kRh5s
 DboLeezgdS0lmQo0a7A5csEA5FR62vohLkzCWBMINgCyGCFDj5mEFmaKIBbQkdTtrpvvkIBKLTJ
 SlZJSzR5j+D8x7YnmElhgrcH0D/QtqDKkvK/uzLVPcoi9Jj/EWtepDx43u/gTteHKv4w3ypxd/v
 Y/6yG/MgENhO781D5YQ==
X-Proofpoint-GUID: 6SJL7dXS3bvfcXCRHL-rDJhMxE4OaDky
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeae892 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Q-fNiiVtAAAA:8 a=b3CbU_ItAAAA:8 a=JfrnYn6hAAAA:8 a=hLbFB0PV-noiyqnaVYIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX2GxH6LaeSHY/
 wAM4rnsC7cUhKgEctR3qRLK13hq+Ij/I3RfUyXm2uT3Cp1NmniX4g5FrdF70mnSuXUjhtIvrEJZ
 no7TDwuDQiDjYrzUw7i2o8qRbXwUBto=
X-Proofpoint-ORIG-GUID: 6SJL7dXS3bvfcXCRHL-rDJhMxE4OaDky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_001101_128529_70AC077C 
X-CRM114-Status: GOOD (  15.14  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds a vcc-supply property to both the dt-binding and the
driver:

- Patch 1/2: dt-bindings - documents the vcc-supply property as an
    optional property.
  - Patch 2/2: driver - uses devm_regulator_get() to obtain and enable
    the vcc supply at the start of probe, before any I2C access.

---
Changes in v4:
- Rebased onto the latest regulator for-next branch.
- No functional changes.
- Link to v3: https://patch.msgid.link/20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com

Changes in v3:
- dt-bindings: make vcc-supply optional instead of required, to preserve
  compatibility with existing device trees that do not describe the
  supply.
- Driver is unchanged from v2: devm_regulator_get() returns a dummy
  regulator when the supply is absent, so an optional binding needs no
  driver change.
- Link to v2: https://patch.msgid.link/20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com

Changes in v2:
  - Made vcc-supply required instead of optional (devm_regulator_get()
    instead of devm_regulator_get_optional()).
  - Added vcc-supply to the required list in the dt-binding schema.

Changes in v1:
  - Initial submission with optional vcc-supply support.

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Shashank Maurya (2):
      dt-bindings: regulator: rpi-panel-v2: Add vcc-supply property
      regulator: rpi-panel-v2: Add vcc-supply support

 .../raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml    |  4 ++++
 drivers/regulator/rpi-panel-v2-regulator.c                   | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: 5436a50a0b44b448f965e928507b5159059dee57
change-id: 20260907-rpi_reg-8c6885b35e5b

Best regards,
--  
Shashank Maurya <shashank.maurya@oss.qualcomm.com>


