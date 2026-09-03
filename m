Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E53DC624DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 08:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vRgZrq27hq0oEgdzEEkKaFMGpusc2dXPPjCTmdBwGZc=; b=pEHDMECacC86XZ
	lZZ0yd5MM+Rlr8fO3d4jXMe/6wf6VDPZzLUhFEOx0eAvj6sEuyy304Kp3Jm6AA6+bDuhAmNEV8bew
	TPLA95j2kVB6qFqoztbssg40rLHgX5WWpFHhc/ZwdaoYK/yeXmpx6QGafWlcN2G0Vb04NWe1wsssH
	53S+xCFzaygef6qc7RcGPRtetQGFf0oh8GlNzaAgUjVsri9Y4YQ+5qKQ2DOpt6eNeHPeHdy0BFfU2
	3bMrBN6ACleW/Ku1EJrKS6P2oZPhLLIsyX3NltFBSWKznssrdYrvxCg4Iyp9SYvKPzNL4dezrb14V
	Fw+sRoY4QF6f9YvkvP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23AA-0000000GqXA-2Sf3;
	Thu, 03 Sep 2026 08:51:14 +0000
Received: from hqu.edu.cn ([210.34.240.11])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23A3-0000000GqT6-2uHQ;
	Thu, 03 Sep 2026 08:51:11 +0000
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAnidjtNJlqIyYHAA--.14117S2;
	Thu, 03 Sep 2026 16:50:54 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Subject: [PATCH v2 0/2] Add initial device tree support for the Xiaomi Mi
 Box 4 (MDZ-21-AA), an Amlogic S905L based TV box.
Date: Thu, 03 Sep 2026 16:50:49 +0800
Message-Id: <20260903-mibox4-dt-v2-0-fbe7c04472a7@stu.hqu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywqDMBAAf0X23Mgag2hP/Y/iQZNN3UK15oVF/
 PeqvfY4MMys4MkxebhmKzhK7Hkad5CXDPTQjQ8SbHYGibLCBkvx4n5alDBB2EqhUgYVdgZ2/+3
 I8nK27u2PfeyfpMMROIyBfZjc55yl4vD+dVMhUFjZ2IJqWeuuvPkQ82GOOZmY6xHabdu+YCvdf
 rkAAAA=
X-Change-ID: 20260903-mibox4-dt-f64044d040ad
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=1jreX59VlvGYO9tLyBaju+2/tQUS9fGGA20lVDqRNpk=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmTTthXHuQ7ktSSGtjWqT4sBXWgQLeMnWCaxJK
 P7NGHXVHZuJAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCapk07QAKCRCaDXJbsSLV
 B1/vD/9n76pjx6OB0FIDSizTDmsuEVk/TnQf1NtUPvN9JiusX4NYqiHaCnVUQQ0senqebUn+cch
 A5zBlaBG9Rva/tD0TVShBB/T3a68LtjDLX7GvFptweXJUKdNjISKS7Q9/nKUrjGSQvkRNXi1wlc
 55ZxaIOqGUwlO87H2FU8/IpbQpZ9Qq5ZfCaffDS8noV+8zpJunSImVe9LHBxUKXA/TSdI+g5Gxi
 4UFz9u6F/AQ9XTyK4CsKJoF50yF0AenvqJd9XqiqJEN7BDCX+fEVnD5SWUpmVIrKVH5VBB93JWh
 XCFdlf/oBu/ghW9iByVT9E/zLJt4vqgO64aDWtB6mOlid9TTd+AYAhOv8CIT+hHeH7D21yzQr/8
 7fpbOSMyCxf34EKirMuDtCyIyRyWV4Ac7nVunCKlKX+iYav7XYV01bYg1UtwMXUbY7+hRmXrCKj
 NZ6iqpOOcTDFsgmOOYxb01f/2pWnH0Y0b1vQHw8TNC3GcZIdS51RgdoiqaZxiWJKsi4+jjQS3U6
 JLp9sT2W0WpTWj5S01itHdNKOFJBU2kpJI5omSImrhDLb1aajdBCOWGL15PvcsvhOAAVZ+ljKdC
 OeUdv+er00/xdEytPDSDVOD4emCy5QMUmRh4UhYSA0ZarB3yFTHSRJdIIGmbtMa6AeDap/LnWkM
 YR+38A5Yiw91nxQ==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID: C_Ai0gAnidjtNJlqIyYHAA--.14117S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UGF4UtryUJr4rWw43Awb_yoW8ur4kpF
	WxuayrKa93GF1Skws3X3WUuFWrXa1kAr4YyrnFgw13Xr13Jr18XrZ0vFsxXry3CF9xuF1U
	tFyUJr1Ygw4DC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUb8hL5UUUUU==
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCOAABsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_015108_213252_97D1D048 
X-CRM114-Status: GOOD (  10.58  )
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

The series adds the board device tree and enables the main on-board hardware, including eMMC, RTL8723DS Wi-Fi, HDMI output, HDMI CEC, USB host, IR receiver, power LED, audio, Mali GPU and the Amlogic video decoder.

Bluetooth is currently not described in the device tree. The device firmware uses the H4 UART protocol, while the current mainline RTL8723DS Bluetooth support expects H5.

Tested:

* SMP (4 CPU cores)
* 2 GiB RAM
* eMMC
* RTL8723DS Wi-Fi
* HDMI output
* HDMI CEC
* USB 2.0 host
* Power LED
* Mali GPU
* Amlogic VDEC

Also verified that the sound card and IR input device are correctly registered.

Not tested:

* CVBS / analog AV output, due to lack of compatible test equipment

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
Changes in v2:
- Drop the LED label and use the standard color property.
- Drop the redundant Mali GPU definition inherited from the common DTSI.
- Document the custom Mi Box 4 efuse layout.
- Link to v1: https://patch.msgid.link/20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org

---
YuChia-Kan (2):
      dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
      arm64: dts: amlogic: add Xiaomi Mi Box 4 support

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts  | 339 +++++++++++++++++++++
 3 files changed, 341 insertions(+)
---
base-commit: ae77d827fb0e6fb2faf8186f075c6c337f2dcf08
change-id: 20260903-mibox4-dt-f64044d040ad

Best regards,
--  
YuChia-Kan <raspberrykan@stu.hqu.edu.cn>


