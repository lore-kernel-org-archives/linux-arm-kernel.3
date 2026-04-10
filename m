Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEDFF44858
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=; b=YjzoTn2mBoll5y
	U9k3e7VvlrSQsReGuIhxQHUKQZnkKhK9FsT4Qx35dErIa2W1YIhXZ8smPOW5RZsJVlO6whBE3Klxc
	1hDFS6AxKbES2H47wTX3xDdyRGxDhPT0GcD0+camXcQPJY+oEfR1EP0bfTbeK50/47pGX8bAi5Nmb
	9pJiqduqGNgbG3UnpeQGx4HPuhfXIHoIdS8bdmUhEj5/feWVnSLFPREZMVmpU5k7krmARV2x2yh3n
	5sq9lAaoV/UfmSD49FVmaBRMok4uKd1mgDPZgLZoEZol68pSFPrr6ezbIopo5un8OH47OFS8CWWV8
	Aj1g182yI8yixPlncphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXu-0000000CHcK-35N4;
	Fri, 10 Apr 2026 13:05:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXt-0000000CHbu-0mlI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 13:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=; b=pnCBAiU0WVluCxo8d2OIjd4zfU
	Io0GQoT3Aqp/GrRuB7txGVFNZW3M+0nEyC8eXmRwnDTvgbvuJgHEhkVcoPW8Kd2kKjlDYkkGw8Bbs
	nPQ/rWU3NB03J93rOAdqB6Sf2Wh0Tzm7xB2JAlTiin9mhZEBX07WMdsKeTjktTYvypX2Z9ZotQtub
	6BD+SYGn7rS8sVLfMv5f27yDlgj+TGmlYPHg+8yl7Ou9EtJBi6cgTPfLNYmCdRZCu/bCXIRO0JpcO
	+BXHp6PbtR29VfB9wDbJ4DKwPhbIHHtgfdUatOzU1HiBsM4tOelCaLCzida4AjyOlTJC46KXLL+yS
	r64yfP8Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXp-0000000DXGN-2eHQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:05:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB13nh438883
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PKGpOYEOt3kDvtmS3WtStq
	ecKftz6DotNJihv0NRd50=; b=K0VAggTvng9Bjs7Krsu/Hj5qU2wi1gGOJBqGOm
	EOWsnMVaG6ugA+XUngevVyd0c3+yABbD/bKvsDQYii1u9w+Qg4unoV92RmmORx67
	X8jnA5Fabn8k4bEFtUs9S4vbIjkM57ogA7ouBar5paF319V4t35y2l1F7H60GSKz
	KyQBIQN9iDRRvCfCi6PUbNCxH+FcGmF2idQeuKdQiYTMmysTK1lhQwM0vhYFM6xH
	ygO+QmkrKrhuIIfgKn1LclT8xgomXQOrE1VwW5O3xQptJ67+C17gJNBLU4Q0dFsx
	EkUL7ywjp2UWhq0t1Li8/FWMv7n4OveuLau6h0ErCbGl8q4A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9rbrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-68582ad07ffso1574331eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826304; x=1776431104; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=;
        b=PPXoBCBRRTrg4PtoOza8Bra4OIcJfDmFHi0O45dq0f48H/zMXFO1xNrmWIz8GSgE7R
         qqtFI8bmAlJlVKGz3+2UD48z6uHWvZUmo+fGpXjPY2e+mvb2p1SJTEVH3coxh2Husj0K
         Paa+UE3BQWxNp/Z9FX5MFrwNYIayfQ5il2n17raJyF63YYOPfJOIYlF/qEfng5iRXthl
         SqR2PD48svQKg9C5HIv5MC3eO9KoMhX0jBUoB5153wnrgqeBE2Qjiu3z+y8ya1Psnugi
         /IjDGhAkVhV0AEqP1jmDi3oAYiHXOK0LeZiRrUqbCGZMgB5InetV0jpKFY6/v5igk5+n
         KJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826304; x=1776431104;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKGpOYEOt3kDvtmS3WtStqecKftz6DotNJihv0NRd50=;
        b=N0UgDDZthlbs7LqdOZX+L3vHP+LFD7swv4kpzCwG6YXM3J/a3SvKS39vqA24YVKpyW
         L6VJrGPPa9om1vPczAVu4GT889JWo1mlNqla+GXELMjErUBQp4aB6W+JwYNkhMfgBy78
         WmSX+bwb5ggzOlL3kgfuCgN2vnMNi8h6htxUVEFPS7xi1nU5d1w8X8vJZBSIycuz71ft
         FNzQnHYjEOa+s4sZiN6HQ4PuFMwpX1AJnAIw1851mDdmtcNozP/9zYW3Ph2C1quNREJQ
         b6FA9QucINovAdYoIofLD0ewEduw/6bJvB+1Osa2twX7L+/AqMQGvGo5pADNGQIrixC/
         LUQA==
X-Forwarded-Encrypted: i=1; AJvYcCXZxLHOp4AopshJoieXE6QZbVIBETOEGoYYFEbsYMBsWbNBcxtUhbSS5rI+64aoOX5zQIKw5fL0ej64aNsGNcvz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/grRUOPhgzjuC5d8EF0DuVUoo8eg8+zb+7X0UquVKWSPTEAlu
	QHBT+5Durv4AeRFe7NJJLvRFpBWUuc+1jNesMULDwORsCHzkG9QQ1x/QpiJn4Dv9A6HW0Jg6NTs
	fcr2Ecb0ZG5OZQRK5qobXdk1pg9TlfO4R55+gJZxFLLXro7Dg0/WGeqejMoeiMYoWm0mlGRjJyy
	IQFg==
X-Gm-Gg: AeBDies5WX4Zc8VIUg8XFf/ofPIcsnZ304NnPaT1QP47Tj84D6Owa9C0L4GF7NnKbM6
	widmcD1ehBhDLrofhm5Q66cpTQu+AKNuN2CWy402dgJAoKeo/JySKgbyucs3+rEfU0jPBYLAWXX
	fEEh47jCCZyyroT6yPZKzQ/Q9V40E6nf0jgMep/gCR/rx8z2o4dbePuGzqrUVmoTZMgX0ZEAfc5
	TSnVsYLJAMBo32wZazsNgx+G0BJu4W9UlazBQ6C9Q9RPlp6syurot2VZVdHHHkLIyVDDFl/8HvJ
	rpLCkyBWfwJ8RC3p+BDVGqhrHCNSHT76sd42FELpR0jat5aYaFidAOpM80ZXgT954oqDO6ogfsO
	fAEN6SVuI3EHx4xmzrlRwWI/brHKJCJObMGmjDa7n4+4F
X-Received: by 2002:a05:6820:6008:b0:687:2d4e:8512 with SMTP id 006d021491bc7-68be86d04edmr832921eaf.49.1775826304270;
        Fri, 10 Apr 2026 06:05:04 -0700 (PDT)
X-Received: by 2002:a05:6820:6008:b0:687:2d4e:8512 with SMTP id 006d021491bc7-68be86d04edmr832894eaf.49.1775826303813;
        Fri, 10 Apr 2026 06:05:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] pinctrl: More compile testing
Date: Fri, 10 Apr 2026 15:04:55 +0200
Message-Id: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHf12GkC/yXMQQqDMBBG4avIrBuYiIj2KuJC418dKVEyUQTx7
 qZ2+S3eO0kRBErv7KSAXVQWn2BfGbmp8yOMDMmUc15yYdms4l0MXxOhUfxoLGPoUNVFyUypWgM
 +cjzHpv1bt36Gi78NXdcNRSeqV3MAAAA=
X-Change-ID: 20260410-pinctrl-testing-10edae894600
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vDjc8gfmGKQkQFut+z56nJiHddVoPx2o25I0xNC8pyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV4TynGFLj/eYUtYaShlZW8le3GXFJG8zScl
 s03NytuS46JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1eAAKCRDBN2bmhouD
 13IvEACGTEmnt+40yLlzVQAlkKhO6gro2lzbOp/zQK3xju3EqgEcoaCkKYxlO3SUnvROj0YS9Zc
 cSZ1x8EjbI0bl7vuR0UaaBz5xzXK4mUVMEzatb8BpbinER/75UBVHe/4hIGVBmY7B/EN310UxQS
 jzhx8XU8OKHfFiPvhLSrv7VKrvRnvZlsUFWWGYVgNdf0mEaZDovPMaMRtq9DzSLDmEV1B+YTDR5
 uyT5fpgbRSr6GeZ9iCfOlH/sORehIiUHTdzH5M2mUl6WSGjxfgDvoSDT6+ua4PjMieLBumpu+ot
 ROa3ds4QHoab6obHagcuygOSQJNokGUTVJxh9hAcE6MarHk69vghzuNWkBv9tinT5IHRMo+XcG2
 Hg7/vqmHQHjOv+rc4ohh5Ek/eSodSv4EbgLbJUL+ml9aCF0uLzQRXW+UWNxEXU77vCG0Q0oeQpR
 g+J4k4U5V9XcM/ckVK309HSyWSULVO4L5wZDWLsgbSpoctAcF7slx0zz3WQfIJrwbhC1W5ytbpU
 ar+NY0CskxlF7OqHMWxRYPkclXqnqvmYuqEIj5aSYBRt5W78tvQBJM4mYQeca1laoaSYn8bzHKG
 Xd56WGAO/VGsSYbCCTYl3XCoM30G2j8UGUfsiPegRWluD+vRvuRTF2QB8V5HX7lywkeAUpSFQ9U
 g6+8QDMa98j76lg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfX5tQgHmBlCBti
 KV+prjLLLzffcurPvGYpMq4XqscXLukFSjZ39EeAqOC/GJYUvNlRK9l0lJfkUjMcRKMF2VTMdPL
 H/0am+d922skhunXSqkhul5gLJ76G7vso8QbtvUeZX+VTmYB249aK45hDMaaxed5LYYl4rQ4frV
 +YVxNmNmT8tUUUNfOHIPY0Mg9d1BLMT5IyfU54hxNouuOx4KjbuB8pz63IBOK/S51ffJvqv2b3f
 O7ziUEe2gogJTXruc9qTYZb3s/Ra6DbZYS00VF6dQc0JWQ2ZZls138pEtU3DBBb4wkoxdQ9k0/g
 Ahgsfnd/nlIw8bQniRF9j2q7xT5RoFjrPKLBz/eM7rftl72hRbr7fMRxpXsd53SahujqzpH5mI1
 /0Ie0S/8IH2wLbl5p/FKoMRuMtwZYzb8BiGlLbOyg6as+OgvpuDvN5ZXzu1WWLQmOfm6fUOLv5D
 0NUNwb0sUNdRo5pS4DA==
X-Proofpoint-GUID: rrjwJbrNoc0PrU2W0ZuYA0ONpOtYBKT5
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d8f581 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X4zHBGs9HBKMUBQ9IvMA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: rrjwJbrNoc0PrU2W0ZuYA0ONpOtYBKT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_140510_080451_EF17527B 
X-CRM114-Status: GOOD (  11.37  )
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

Follows https://lore.kernel.org/r/20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com/
but should not depend on it anyhow.

More compile testing means better bot coverage. Plus having ||
COMPILE_TEST and obj-CONFIG_ARCH_FOO is kind of pointless.

I built these on arm, arm64, i386, x86_64, sparc, m68k, s390, riscv and
powerpc. Branch is pushed also to LKP, so more build tests will follow.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      pinctrl: realtek: Enable compile testing
      pinctrl: aspeed: Enable compile testing outside of ARCH_ASPEED
      pinctrl: vt8500: Enable compile testing
      ARM: realtek: MAINTAINERS: Include pin controller drivers

 MAINTAINERS                     |  1 +
 drivers/pinctrl/Makefile        |  6 +++---
 drivers/pinctrl/realtek/Kconfig | 12 ++++++------
 drivers/pinctrl/vt8500/Kconfig  | 13 +++++++------
 4 files changed, 17 insertions(+), 15 deletions(-)
---
base-commit: a53c56fc5daedea57de51c02ede0b48f055fd8b3
change-id: 20260410-pinctrl-testing-10edae894600

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


