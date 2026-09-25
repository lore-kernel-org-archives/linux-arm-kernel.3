Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6716BC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M/DWbxeGSIRIL3H4zTAb/a2zRJf/Vq+YD16QWknpe5Y=; b=rkhk6xLdKYOktofp05FMgJDbZ3
	RB27NtSyx4Ceq3AJQHnBOFvmQyVIDO7aDlA6Coq6m2utCCzwlP8ePZ3tAJYh1KqVLbH8u42656Gua
	Kk+qFfk+mTmnsP0u6GzaWtdt4vlTq8qNV0pXqrc7Q1Qsmt6Wy23fdOH7RpWELmvIXlFf+KR0U5Rik
	xs3L4t5qg1r/rTN/kAIAlINbVzbh6/hsoOz6HfGPwDpuHIn6MIGNPp1S2GDIk159wJNV/NXSbPlxA
	T8e52HiE21/rIHK7pXc8PNoV93Zf2jhIwzzr73/2JkGsn3g/xzCWSjtYBkmFEFPMSWoj8vIaNr5nT
	ALficpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0b1-0000000Cq5J-1OJu;
	Fri, 25 Sep 2026 07:43:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0az-0000000Cq41-32I7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Sep 2026 07:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=M/DWbxeGSIRIL3H4zTAb/a2zRJf/Vq+YD16QWknpe5Y=; b=OFdPQD0m0ui/iBUy+YBLEul7kJ
	95en9BfS0yPWfsRuaJXx+uphnXpSsLXv/1LzVAq844ryex3LW8NHyQ6E+sw1UC9vRyRvPKO5WokoM
	Vh5VXx/2Yi9m0DceOa7tDfTWCHWIO6UfSrbLyrGdp884RiK1n3Sxm53cxN8mjtQuf7J3xF1VK7FHy
	Ke6+YVgsPKO1nvolGN4lT9jzCp8y8YNS5/7kR8a6OcNkMJq5+Q0xM5pzEZx1l4laJaFGTfMA4gP5E
	NE3ziKoE6DbUy5deZTLjN6gMX/+zZ5JziUNNDnu8QwBieQ8J/LzDuX+Dzacw8NZ6vb4Qg4bicQjOD
	g2ws+PMQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA0ar-0000000Ghes-12wU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:43:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YoFB3532401
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M/DWbxeGSIRIL3H4zTAb/a
	2zRJf/Vq+YD16QWknpe5Y=; b=LIiqcfKqXKmfhIK1/ZC+Gtaf3+7ej0KjyJj9ov
	/ZywfjJGlyXdR4PnLawwfhEduuhiu2GlWaGWZ3GAXVyhmCxp7Zan0CH4hLrCkAZi
	EmJxswJW8CFnllbKvCUDTen3RWWjPkyNOUVmgybxJ8q8aTXntqza96hAVq9v5gdd
	HNZT4/6/h+nbxkQt4DtSUGNUYFfFlXcfT2Zw9k252Od6Ksp6VVWm5tpPG8ENbdej
	5U6RDc8IKzBwqwuAnSq2dlciZhMBlUBpE1Vo3P8ZkNfN5/gT1t+Hnj4qLROGPXCv
	gT7a4pgX2tgHnmUxk0Ld1AbLzHJ8jWsoBQW+lFNuKumA/qwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94ka8qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:43:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53094ff7090so19106801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322216; x=1790927016; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M/DWbxeGSIRIL3H4zTAb/a2zRJf/Vq+YD16QWknpe5Y=;
        b=MDZ6lHHgHVbe2bVHeGxWkK9JoA0x1SFV6K4R6HEfvrQNzwT3ExG2R2cNCc6v4QeNyG
         DMnsyAwvBfnIwgz28+XvkOu1xWI8Y/g4Thz38C3Yfa01JMEn3GlhyXaWPIWzcV/AwbeF
         rpP15aON1/VbBqV9Cq0pj2YSXMXsw5ZgzulbZ1WhfQ09qL3NJ2jIcJIdkop++0L4KEhd
         v10Kq2kIgkN8ElWaD4bNsB+aGqkTzqxkpF6R43Kc+z0gQkXqoERjX9JgOPWyaKvDNkkr
         jUQhROmHYjGv+l5xG1DEb+143gv90gFpQNJLpkl+WGU2pRhWqp5QLmKzZSeXgbkJ0Joh
         2kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322216; x=1790927016;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M/DWbxeGSIRIL3H4zTAb/a2zRJf/Vq+YD16QWknpe5Y=;
        b=L35VFknAiD2IoMpPOCP3NYpg9uObqZ8Iqx0EK5VZi4v5PYrQ7IcBXj9OhGqrh2Sfz0
         eiZNhRkjnpgV8oadaknju6trhp66KHXfPINXce9ZLWsOOHq/vd16LB3kyeBKaC9zqMQK
         Vs3wVLCDD+8hNmLZVtGHZns0vFu90Eha6zXJDxdhXo7Z1R8qCFSGCBglGUTB+vGCVb6L
         bT9sgsqRGK6Agzv02E0d8Z/KJV/cquJdiRYr2V7Ee/joWMk5sAnVHDwYl7gnJfszEcf3
         aMgRfjzAWTxV5nC/1F4MQ2Q7XjFjv7OKAcw+ehV4q++C8YkfuELwNffxkph86uun2GQi
         npSg==
X-Gm-Message-State: AFuF++mNFV6Iire7+UMKiq1kmEyiBkhVu76znZUoa0cTZpoS7znT2yzP
	oaNv8MNs0+vRh0Tt4dqdC39f9qt6SRTGih4qAtTalYKJnEQ9NSePj1pDJskMpgBGMBCV5A/KMQB
	IB6VPitf0r8641aeleaTS8GxSxRneN6baBNQwcBypXaJsuRMDSrLpoBqVNPpUROASL0BE6hhzm7
	eJLw==
X-Gm-Gg: AYBFou2QeCCOY+EcsKy7p1/iK0LGmewGv6pXCrU+0aq6NzUTe1Tc6BCDwosE+e3k6+i
	w7ithCuzBW2eYLADZ3Aw8Oy8C08BUvmZBb4x92GRQqSadVpHQ6cLsBmf1hK6jMao4gZtqcXREV9
	6OtVG5k9Sl3MiIp+/tMI4ePZoYZz7KR+cKDTRpFmKM2+BTwsIwdbSx83pqkT9GjsIBgzRBU5SnS
	LSeAQYUfYm9DQxgtc6k3nwqw5fnmx3lvR5zTefAh7ela7giqQ/Tio6SjBI1Y+YcCP/Y5i56C3rw
	veHpkb9qA9VvfFJ/H57LZ2MshbMuqEGNI/ptDbuMKXn+tAD2tDbXUFPJgBBOdqeLWYlBBBqIh38
	+DmzOlYeilMltGbrDCn0N6+/kI5LX
X-Received: by 2002:a05:620a:2b94:b0:93b:c3ce:9056 with SMTP id af79cd13be357-93c43cc71afmr302934885a.1.1790322215739;
        Fri, 25 Sep 2026 00:43:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:93b:c3ce:9056 with SMTP id af79cd13be357-93c43cc71afmr302932885a.1.1790322215287;
        Fri, 25 Sep 2026 00:43:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bde1:52f9:d7f0:c581])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee911e9bsm53820945e9.1.2026.09.25.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:43:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:43:17 +0200
Subject: [PATCH RESEND] arm64: enable HAVE_SHARED_GPIOS for all ARM64
 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-arm64-have-shared-gpios-v1-1-57fed3fae35c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABUmtmoC/4WNwQ6CMBBEf4Xs2SUtIARPHuTqQY+GQ20XaCIUu
 9poCP9uww94meTNZGYWYPKWGA7JAp6CZeumCHKXgB7U1BNaExkykZWiFhUqP5YFDioQ8qA8Gex
 n6xgLXWpRmcroPUFsz546+9mWb3Bprs35BG30B8sv57/bYZBb+nc7SJSYS9XVRabuueiOjjl9v
 tVDu3FMo0C7rusP/MHD0c0AAAA=
X-Change-ID: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Drew Fustini <fustini@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Frank Li <Frank.Li@nxp.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AD6u7FdoeUADwTnTJ/GsHGXbI7Jju8HXgSAGAH8Uy3Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqtiYgnMpt+ze/3gOBof/K5QUMTpTjKTsj89xpR
 aYhi4BObeyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarYmIAAKCRAFnS7L/zaE
 w0SrD/4vfSDU0oVoElzWp+gQZ29LGTH8q+y1RBxSnlUiiIpKfUXPbSaGgB+OtaszwgI8R+/H9ib
 iDLtS6bnV5R5oHaqG/zkpMt8n9Ghb5CdU4kriuimfC6KxSAp+GL2zmRQkKm/w3Tjq6rYahaRFn6
 PZ1WWNZVe56L8nlVfDjpAAj+r4UQxuOKyrCFjAxoBpV2wsf63ryBOVHZgUOMkCE4axrjBnBLKmp
 ert7OYK6xC0bB5rDYIhEmBTAj3dutD6SsHHbWVLKveMUUIvLbwm7UJBN2Mv2SUB5tmFrdvhcGmo
 dInoZuK5ZqTWUk8gN86l9XeQeR9fXk9QBiZRhhHz318rz/saJMOsqbwNhBkWJgKOe6lZt9YlJZQ
 MgaOS0lMSXaZwyGfPpPisDvspKulNpl8dIAe1tO/ctpD4P2c8cnkOOstPcthxhFu1h53CfWuGNU
 4cHO7+xICvfFb4ceqaA6Y2fqMvO0Cb8e+0PYQwY8iTl8sfFwdQn3q5/o3Me5IZJC2aJQ7TnUfKQ
 8h5OyCQQjAs5Wsaqi0wG83KVVCar3GL/o7NzlRVp5skiDE9kdpO/bQsmifQaGLq3mx4a6G3s5zv
 Y9mxgrHgu4ny7Rnku2vYmEOqHAqqE61E3nUKFzbF6Bhk+HC30bPHh6KPSJ9ez+3uxlvMGcgtc0M
 rLchbTXc9wQBXcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab62628 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=xAMoY1eAQyGtPIDUt64A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: O8NUP8CdILowxGydcbVFYKmeBBccgTwJ
X-Proofpoint-ORIG-GUID: O8NUP8CdILowxGydcbVFYKmeBBccgTwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMCBTYWx0ZWRfX59hSjYPur2FF
 YOGmJI55kGk+TnVFKRWLCNBRZ8HhCVT1pG+t9E8NEUQ/YE7ENckRwkXw9/NEXJptHhUqoCvRPDX
 wMNWKD1qKDD/tuSbx+yRTVcCzuR6GTrH0lEun8yEbHseUJ3c6ITvWmhk7F6AKvmGTHXOL6ji4t+
 4Emku2t7xInfPITi5xLkbLw7MrjvH7LIvbo/nUvfUNRSWcCjzIiFgRV7QV+uuEsCLHFhIpsrLDa
 zFl/CpUZpInkx0RBGp5vzjCcrt1UGU7Ki1vZpq3dhjiITVuWfaq7yEZ2kiP/kyhnTneAinLeFgA
 v+++U/GyhnbdfEGF0pVdj8fo9m2PmLdR2FDrFcXVjnKXtHAVC9xmWvj1YHtyC8akSml0iX5Zm8d
 KA0ETYzTiFgPKVSYPYKA3QZw4TXFMcZVzmxCvx0Mex7EaHlsDbG1eEaqQl557+V/NQS4o6uEACx
 K0ksSJpHRZZUA95/SMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMCBTYWx0ZWRfXzf/7t0jl2JNM
 Y8y21qY+jUr+noQONJ1byzqx1Btvku7CsBCp4fBGJXoNPf8bdIrwp0mXs5/nOyX9mBvIgjEXaJY
 IgCVFAbIHPohDCVTohYJqPztqVxLVV0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_084342_359756_4E7E0ECA 
X-CRM114-Status: GOOD (  18.79  )
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

Shared GPIO management provided by the GPIO shared proxy module has been
enabled for Qualcomm platforms for some time. By extension of the
defconfig, it's been effectively enabled for all ARM64 platforms when
using the default configuration. Bugs discovered initially after the
feature was first enabled, were fixed and I haven't seen any new reports
for several months. Make the feature enabled by default for all ARM64
platforms officially, which will allow us to continue the removal of the
deprecated GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from the kernel.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi ARM SoC maintainers! As per Catalin's message[1], I'm resending it to
wider audience. Can you please queue it for v7.4 via the ARM SoC tree?

[1] https://lore.kernel.org/all/arPfRFC5jzVaSQvq@arm.com/
---
 arch/arm64/Kconfig           | 1 +
 arch/arm64/Kconfig.platforms | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 94cc8075460f0a763cd82b2cabbdb80275042935..19e453b1214353e842e0aa9d3ff9f684c5b693e5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -195,6 +195,7 @@ config ARM64
 		if DYNAMIC_FTRACE_WITH_ARGS
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
+	select HAVE_SHARED_GPIOS
 	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_GUP_FAST
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1489bad527d8e61584b2a29e5161820cbc0ec0f7..21fb82ab4983f80fc3eaba7cdb5627cf80a18c95 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,7 +37,6 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
@@ -329,7 +328,6 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
-	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260907-arm64-have-shared-gpios-4c6c07d7dc5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


