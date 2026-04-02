Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9F2D39426
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I0iEYnM6TxpFjlb6DDopS2eLno0oaG8tAIZJH9RCSIc=; b=SMFNKBtM8oKi7F
	WiAsKa0B2RyjU38AJgnJ38aHAbCpqoDXRYLpArqiV0g/g+34i7Y8fFyoPuhew7bFXCWza5WZi8cB5
	Eik8mBcIf9s6LrHgPj7NxdrGOWMJkFn06i5afUFWyKMCEquKwkuqErUx23yYQIzzEsVi1c4FgJ2q8
	q3isl36G8sineePIwc8qE1ay7WZb+jduCPfZik7Us7oPz1sADv6rU9jK/xyat5/anKfz9GcoadgB5
	sQB1tqkKng6Q7Y28Wmm30tE1VgiMS1aRhU5Y/lUZJf7tTGZfNERS8u32MuqUiC3noeKmk+JWs8c0C
	6iebuA3yOvOgYL6NTa1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IpY-00000000Hag-1oYy;
	Thu, 02 Apr 2026 14:15:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IpV-00000000HWG-47CH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=I0iEYnM6TxpFjlb6DDopS2eLno0oaG8tAIZJH9RCSIc=; b=mr7A2CHT7/8mlh8uYdlfPa5dnS
	aD7VtJrXogRz3/kyJnBnQAz/DVD7+/hmxqGSi+pWD0ZOni0Bg/JXfF5122gpNzsQfr8+hHZ78Crb9
	6IKs7dilxv08lt838KbfJQlnilJooJgqNo6g9BN66jTwgZzMwJH2T4gaw6VVO5WNiwcojDNDZRzt+
	fTAuxabwk9/EtwHRmUS7RgL46hFecjatXkQkJQpX1LuhsPrK9Ny0AbcOVrL14AawVRjBwUwW27tyn
	EbrIwv6qFbn8tbifqOXZ+rHqKx3134D3XpFxemF1lW59uT5ZS37P2TAZikoiI8HBqofrzBU7krPLo
	vsqpVpxw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IpR-0000000CPmD-3FR9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:15:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BtRar3238770
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I0iEYnM6TxpFjlb6DDopS2
	eLno0oaG8tAIZJH9RCSIc=; b=VMfUXqfEvL1i05v9ML1s09gEgzAP8RxxtyO0GR
	PbaWK6ex2ZXp4fX9pnyChWWI5ch0d3wSZb7Sg4H8+D9yUJ1dD4iv2HZJVKOyiyvR
	dWbzTl35sh18TTuk9fhAl3F88y7Q6ZDomkjzYPiLjMLwgC0afQoPeQ2wCU30ysBz
	BHa6PLsM/2mlEpORmwLwQCtX43DYgaT4OEUbyhVXFh70asqmwERtsSnw97QUGv2a
	+o8G+GZrcQZzgUDZG7oABwbqQU+8LzwG+dHeOq5TciIXJTNyN9qy4lGSBcZi7SHG
	J2+V8SIDyGQehrSL9uKLW9uevE+ocum0dLc02mderrSyyZrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9r0u0jwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:15:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b802961ecso10259751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139319; x=1775744119; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0iEYnM6TxpFjlb6DDopS2eLno0oaG8tAIZJH9RCSIc=;
        b=deTXVQjeuxahaDYr6O1G+B7aWQpGZBwWAs8F4lDcaUOUEAAJBscfjf71bIiWlTh4Xd
         yujzCpDVHH42Stp53MyeK6neA3LNNsQoyoDORUThyDOwhAlf4oVroyap1IhzkmiTEsjW
         jJqWwQuly8XXrc4zIvV9JjBv51WMi8FVXkCUr3GGHCl3TPi3rpP10g0NtXqWRx0vvtEM
         8iF61+302cKCRYOlszfvRGszR3TTHoz7kl/reojqMJN2zclkZ8X69sudvTqHDg9qgcXw
         TAZOD+Si8JPuqj1wluFS0qtU0BPmFsh1ISL+f9cohwZbYNqhSuROTA8m9C+QlTiZSykZ
         Eoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139319; x=1775744119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0iEYnM6TxpFjlb6DDopS2eLno0oaG8tAIZJH9RCSIc=;
        b=pbgCGQTwiSZExR6gNt5KZzaTp5rucAnMfVfkAB3gsUDj655mT1eqnTbQGx7z+DTpwq
         cTGTmKj9D6t5Svg1DJ2T7+gfawQ+AayhF+eUHeffN5+n5wzhuNJ/7KSc7zqgdkDB4GIN
         mP4/l5ERlY4tCGNPLw47Tp5TQtWREo5B9ew864mn+TtK6fFHoE1Qp4VkIeRqQT3yUF/l
         CaUOY3xySbs+UDnIs9PTKimv087FG5tEmS72PKR/R5BoufONzG2REzRlrroIO0twx3Tp
         v68/LpfBa6jjzAmPHrWK2nn6N3Uz2jS8NGzos6N8knmtXV+eYf12LCbRrwOUX8zcBTQ5
         iGBA==
X-Forwarded-Encrypted: i=1; AJvYcCXt2ZYdr7m3dER62f3snJ9fmjPm8aUM5XemWDNxei5J8ZB+dY0EIFweS+Tm8N4wG/luxiNj3wC1eGA/8X1fQHgR@lists.infradead.org
X-Gm-Message-State: AOJu0YyhuIaFatrGI1f5DF36cFEnZG08i+ONUvdDTRnB9fGj8lZKkiNM
	bMRxMBZuqQ/uAa1aScpvKkw3gyiNHSVdCz1W1/roa5c9RpmgWa6kwO1j2K6QpLc7+Z2P0L4KSn9
	TPI3pej/T4jtt/aSs+GuaoPplOGOo0WCA6FW1bJ2M4rKfyeQs7rtLpEMZi34DtUeKc1AnVkVtHq
	Kgxw==
X-Gm-Gg: ATEYQzxNro9oqwBYvcp8lC28pXdDMHtIS0VMkVe/muOAMQL40H8yTCGKCFALEsfKVMw
	vvAyN+uFZMHX6IUxa44uJho8SErry8lxbtn1sfMhotUvYGooGL5j/LteFndVNMZTR6Lz7rJDkl5
	xLIFk6I5pXeBJqIwzXBSdJcC1cA2L81ugZrwQCLxuArE/B8NuoIdwGlkf01ATTwIDrod7Ys1fgv
	9hC9Y0w5w5EKLVfhHEjUhZw6AN9Q41puytALb2o2coigqKaqFLG0Jk8/MTGPdOygOChBUGMLXY4
	7TBTJRU14muCo8E4RkBgIBHoekWaGjgyvteKq+mLrzTd+qwLj60axFdnB+sC+nAVGWv9m7lsh/Y
	o+/8gQv7eq1FFuu0hjTA/d3dY8v/h5SMH8HlCSFnpIYPuYzWxmi9w
X-Received: by 2002:ac8:5a91:0:b0:50b:5056:fcc4 with SMTP id d75a77b69052e-50d3bb92f71mr104571001cf.4.1775139318322;
        Thu, 02 Apr 2026 07:15:18 -0700 (PDT)
X-Received: by 2002:ac8:5a91:0:b0:50b:5056:fcc4 with SMTP id d75a77b69052e-50d3bb92f71mr104568721cf.4.1775139316950;
        Thu, 02 Apr 2026 07:15:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 0/4] ARM: omap1: use real firmware node lookup for GPIOs
 on Nokia 770
Date: Thu, 02 Apr 2026 16:15:01 +0200
Message-Id: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOV5zmkC/4WNQQ6CMBBFr0K6dkhDKQVX3sOwKHSEidJiR1FDu
 LuVC7j5yfvJf38VjJGQxTFbRcSFmIJPoA+Z6EfrBwRyiUUhi0oqJcGHK1ljJAwzBeCXDw4ZtLN
 1Z5VuygpF2s4RL/Tevec28Uj8CPGz3yzlr/1nXEqQ0FW1bgpsjHHyFJjz+9Pe+jBNeQrRbtv2B
 eDGddLBAAAA
X-Change-ID: 20260330-nokia770-gpio-swnodes-5da8ba35946e
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9xHP9YGJtqo9V/BvuF1Xk3Wt1TALDLTxAhAxwgZviEQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnpgbWuE8PB92kyk7oxM0EhrfC9uGBqdWjbK
 5/AVS9z4L6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac556QAKCRAFnS7L/zaE
 wxWDEACXpxQ47yMXyNOUQwCxOnke7iYT5ZQOnqkVVZvzIPH/rpFUqujwJTR6i77GBhHklwMd76n
 nz0VXCWCxBstpkby2i801FON5C1se1aityaTE0UexGxIDX6a7UlDqNJfpwgkyWNdGXm/bhOawr5
 Gt5aQZHe9u0bHKJf6Ocv5YdO/ATOtNygibon8PvTR43Bu1iynN3LWQH2I29xPtQfSTPf5eYtzef
 4CtWkr1jd8ZqLnth3r4J1T68um/z3XHqjl59apZ4/gdQh9EXsx1pJTYwrwdIt5RZ4l5ezVnpDWa
 Wrg4S3WMXyWmKmJP+XPoZkzKIcSImHJqA1Qm5Q4Tq2Do0G46aRg8WPiSIOsqjX7WByQ/gBEqMDN
 WKvH8saFlplZ05ZJ7TVQKwRxBKHMhRzq0QdullzLHCnEJ3tT85P7P4Du9Zl8TKbWZWmKiXny1qw
 a7p1JALeRLwCRDbgDVY+ZPhblU3YF5s7AmgkX5UOxZMhvOxZSwyPtvneHGZs66I5Q0S3qS9tH7R
 aT/AcxEeqJZHS96PIYfpFFkFYl0yb9WrxZh5E2tu3Cl1AqPJ04bO4UVKuHbtXm+LvMgp5Dy09jm
 PlR1ufRVBI7A7QanvZfKMEz6Y+EcB88mzBac88+prWUsCZT7PpV00MHuHH/11UE3KZURkZDNdF9
 6tH4XwQ8V4izhbw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOCBTYWx0ZWRfX4x2xbVCnD1wm
 Dv8ng8SQEQ7cX9PQLmt6g4KqO/5r3s1yVA7wv/gfr8XWj24udIWW9xmqOMuPEO6z6rqUcHFzNqT
 fdVeIfgSTZ5ctFq9l6ps5DdP8qS9XRSwjIA8pEAMq50etSvZH3mOtyASmUIqrPLINTfArAF81b0
 V9YgvmMB3XmPQhGExm/gV4xQ8wFdmEi7Tc+njAc/TEbR5TmMHkgIiC2qS8A5ra3jsZXrebn2tiJ
 NaGVmy4UI06QN48tNtUQvK+IDcMaB5IX+O14qQf+/XGT1jSH7rs6a20URHjvjwBift5guBPEWGg
 IV32Ww6bP6cUdhuGJV21wygdvW3xoDC1E3Y6RjLWxq0aN8Wc42FFMVS59z2mNJVxfU5xC2NObz5
 MC90ouUecESzrPQ/VGZed3VNcLJds7uRTB/HHPGtCSyEcoNa8SzE0FcYxtIqVwjmNQ3HIP3CkIg
 8c4rPzhsqHFDR+PSfOw==
X-Authority-Analysis: v=2.4 cv=D5xK6/Rj c=1 sm=1 tr=0 ts=69ce79f8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WeWpliTHXVVyQaQyHOwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: OKKLDlrUaUaAknbez0CG8N3iZRYUYysJ
X-Proofpoint-ORIG-GUID: OKKLDlrUaUaAknbez0CG8N3iZRYUYysJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_151526_753786_198077A2 
X-CRM114-Status: GOOD (  16.90  )
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

Mergin strategy: It would be awesome if patches 1-3 could make v7.1
through the driver core tree after which the final patch could go
through ARM-SoC separately in v7.2.

This converts Nokia 770 to using real firmware node lookup for GPIOs by
attaching the software nodes describing GPIO controllers to their target
devices.

As determined by Aaro's testing, both omap16xx_gpio_init() and
software_node_init() run in postcore_initcall() so we need to make
software nodes available earlier hence the new patches in v4.

Please note that while the goal of this series is to allow Nokia 770 to
use software nodes earlier, we're not modifying core kernel code just to
accomodate an old ARM platform - more such conversions are coming up so
the change will be useful to more consumers of the software node API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v5:
- Put ksysfs_init() in a separate new header
- Remove software_node_exit() in a separate patch
- Link to v4: https://patch.msgid.link/20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com

Changes in v4:
- Add patches making software nodes available earlier
- Remove stray newline
- Link to v3: https://lore.kernel.org/all/20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com/

Changes in v3:
- fix references to the MPU node

Changes in v2:
- fix build with CONFIG_I2C_CBUS_GPIO
- only export the two symbols that are actually required by the nokia
  board file

---
Bartosz Golaszewski (4):
      kernel: ksysfs: initialize kernel_kobj earlier
      software node: remove software_node_exit()
      driver core: make software nodes available earlier
      ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

 MAINTAINERS                          |  1 +
 arch/arm/mach-omap1/board-nokia770.c | 30 +++++-------------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       | 28 +++++++++++++++++++++++++++-
 drivers/base/base.h                  |  1 +
 drivers/base/init.c                  |  1 +
 drivers/base/swnode.c                | 13 ++-----------
 include/linux/ksysfs.h               |  8 ++++++++
 init/main.c                          |  2 ++
 kernel/ksysfs.c                      |  9 ++++-----
 10 files changed, 54 insertions(+), 42 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260330-nokia770-gpio-swnodes-5da8ba35946e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


