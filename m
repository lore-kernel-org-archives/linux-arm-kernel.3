Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD2F46441
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eZX3+pV1mLh4qQV/ja7HXP0WPf1mmp2fnKR9a3HpTPE=; b=3M+L9H2evt6afq
	754wfCfoyoKlJHyJ8wGxJk9pKJLyk6ovzftm+EH7JGnwECIRpL8slaj5D+bagqbTfyk9Jtjt/CAGn
	N9iJlUvg0faWyNCgpCXl4brXmWNpgTZM2lKkjel/pF3cx+ovCP4o3Eht0TDfqkpwxW23P1LNDrLDn
	eL5pq/VrA4BLptI35Q+b8C5UQLeX0A8wM3IIUP+6YZHCLjLPPlsAXdoUFHjDFCIslUQeJY+VlJ+yP
	bZzvvOtRuclQd2MUortj+iV3hol7rnGEH7kDLwlwSA4XSwwmc06hykYHVZ4mPH+tSKllJEL6UHlQa
	oSB6FR6mtlGvx18cLovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WK-00000003gpE-39nd;
	Mon, 16 Mar 2026 09:45:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WF-00000003gmo-3x0B
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 09:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=eZX3+pV1mLh4qQV/ja7HXP0WPf1mmp2fnKR9a3HpTPE=; b=ai73JGCkonqQGXWXzM4eYB0GKn
	KaH0ZaL/UN35ehwyzk/L1xejFRVqm1oOrjDo0YUj/+YFclw29pQvl40P/stTr78u4WqyGtNpADuFR
	zHLetiAe44yG5W2pmiV1AtC+9FoTYP3UGfDCK4PqXqXG/M05o/U7/ODIjAI/p3hwSoj0QBEK4oPMR
	uZwVpG6Mx4v+iNIIstjCuM9VTVIP3PxZLlShNq4KyXPN/vDPxQb3c+RHshn+ZeeZoHo82QRaeAyJY
	4O+aizZlcoPy/7TR2VlAD/tj/8XRj8SVK92Nzgf+xFYA4xsYvAfEaJEUUu6iiXtMukAlqOoWRti9+
	SXoPGA6g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w24WC-00000006Pi0-0qo7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:45:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hoU1724717
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eZX3+pV1mLh4qQV/ja7HXP
	0WPf1mmp2fnKR9a3HpTPE=; b=RkIpYnIBHca+sMT16Qy0AUvaVdmiMC/ZMaDeJw
	nudeVmDv68Z0PU1UJ1zceSKj5smRxTI/jOGS1e/JGesQ5HKc5B0m2kkd4cxtPsve
	qPylS5qhdkk7yzcgXLQ6XyDTDDwltTQ3yyNCCtB1zdjB84kBCB6yFULjlxlw/K4Z
	4uomx0/Idy6zBMQvuMh78Ucy1YqKsgfJSe4nV27j1XN0gzLlUmRx4J4KaWvWRQmE
	LiqZ2snYGLS2bpapFcpzTud9dxsxAvAmmsbDj5kbE6LrCDrLWNWCNaTjsTwcnCNK
	r6PWGbLNsdyqN7RlCw9rszhOJlHIKzOTSjAZdxEpwweJFa2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn01y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:45:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7de0e161so3148683385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654342; x=1774259142; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZX3+pV1mLh4qQV/ja7HXP0WPf1mmp2fnKR9a3HpTPE=;
        b=YmnEX3KD/mzuy9sZMp7hOIosxJe0j5Rn40NeGsM8ezzh73lYIUDYUhO88uHF0GF+uu
         E++4ilQTvB4OZD3Ydk/GWx1ow7MZ8ucM+RsnmGNEvZCqmyfUVxqCket4HbFCaEMWKnHW
         S56xHDhLZEzgJpm/WPoleXGXEIa/Mu0FJ7AJU1ceFrDh6WnDxrTcIKMd27UcPBPtncNx
         mTiV3h/BumjVNckFsGdQveOBtxp++Ec3DzPoxWNHCq9ObIJ45dsF8pWFjTyJ6x6ala8R
         9LzljfD4+2WlIrBjyIo71mqL8gp3rhD0RKvc7avRF3y3nwslIIIrgDehTUAt4CPayck2
         M4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654342; x=1774259142;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZX3+pV1mLh4qQV/ja7HXP0WPf1mmp2fnKR9a3HpTPE=;
        b=MQEOGtLt6RXoQ6X2IeQbzAltISWYCk2rh++mfbG46PUw+UzE8pstSFN7dpCSqdvite
         Vgnz9o46YM+H61l4XTksrG/fHWISoQ9oHVUDtojrj2welCF3eI8Cny5zvO0NExTeYOdF
         b7P0gE0Buq+W1lM3weoj7Gr5vACXgWx2BadurDJZ2l5Qv6maLBBpJnIC7E99t7la+q3/
         SCLGvTIi5Np+veunkEGQfa/1t4WTsOTvjkjsYFtp841TvqDXPbr3qoVmqNmZ0CzyfxEK
         WC0QUrRYvwq2wtDPT8IQts53RQ73GThk6xdywoW4kxSRKVeC8X4VL/HNGC/H8DGcAbdV
         8SUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxVJSaSb7b1shPCVLARu/rX0UXsDbAZU58VS/KuaMh6tqeeTUo/NqR2AN53Gk2zprsqu0+HaE1Zdmsdw2GJS55@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5n0ovGY0hQUPRvA+gbSNduF9wy7A0YlUGZoAvwyOG7+zXfTvZ
	7QWyi47IvQE/TwFEcFX5eaVm05DlNAhnKeuF9otKBYS8upNcEDRe8KhH0XHwEf+Y6x2jHvVTirY
	YP8t1PHpV3Hsr1eFFZ9Pf6xt3JWKyNK0WdjoWMR9bsQY5hx9yU/GeldG733J6JBkZxNzLT1A1EN
	xZBSB9dJWV5w==
X-Gm-Gg: ATEYQzxvtkQDQuNnyTzDFePbxu3v2fAwubCo2KXz/EdagQJmKUGlif1V15YOdFnCi0R
	esLHGpkrnulGivVW7Aa3YwtggGoOoj/5e8nMiiRyViu91PVz7izfTBD2o/VeFmWi7dqz0UGIw+Y
	Ug9dNR6TvgeUPecIGeigg9aQ7/r5lJ0DjAVIWuC6FRkJusaH5N15o0kYA9Csy+SDH7WWxV/CmBq
	aVj2+8qmyILNBVWa9AI9/w+jUmN9wIWohWtgqXmaQv7OapmqoM0TuH2E7wuW8Dek0b/0G+mbby8
	FfquDPJmDIjldi2VbB/1ecuMBC3s63Ays1R4reB87wgiyI5SvZgjFwNEDlvj5duguzLjRO59DAy
	+txcD7k2KcZAzSv1iU/6lMirtO/qHnd7nPiQXvMpwjxCmZUXuowbE
X-Received: by 2002:a05:620a:4483:b0:8cd:942e:82dc with SMTP id af79cd13be357-8cdb5b24ef6mr1646094085a.41.1773654341667;
        Mon, 16 Mar 2026 02:45:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4483:b0:8cd:942e:82dc with SMTP id af79cd13be357-8cdb5b24ef6mr1646091385a.41.1773654341260;
        Mon, 16 Mar 2026 02:45:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ab9f9esm503138755e9.4.2026.03.16.02.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:45:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] gpio: remove uneeded Kconfig dependencies on
 OF_GPIO
Date: Mon, 16 Mar 2026 10:45:20 +0100
Message-Id: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDRt2kC/3WNwQ6CMBBEf4Xs2SWlCk09+R+GQ1MW2Cgstko0p
 P9u5e5lkjfJvNkgUmCKcC42CLRyZJkz6EMBfnTzQMhdZtBKN+qoTjgsLCg93rzMPQ9IujbkjLd
 OWcirJVDP7914bTOPHJ8SPvvBWv3a/661QoVdbY2tGjKWzEViLB8vd/cyTWUOaFNKXyKp+Ia1A
 AAA
X-Change-ID: 20260304-gpio-of-kconfig-e257ea7c9a09
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wNifxD/uVuc7NAbXzSxDhaJ7op2FNUcGF/+rEs7q8XY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt9E0vDJ6dx7Ia4fQ84h8eE2etKlWvxV+vL3m+
 FEVG19udtmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfRNAAKCRAFnS7L/zaE
 w6/JD/90RDo1/kiO8qCAJrcGU364A0L3DxLqgOQi4iAqM2tT6AZ4IE8R29waLnPi/L94XNMGssc
 6HxIsy7Y3Ohu7YbbfxiNadlDhwEg4QMApO1BXmGT7W6fGaMT2tujzIZ6P/trHTtxPCxSZPMbm9h
 B0Yk4F+ywcUCsz7Gfo2fflEKhwsAZwFbqUBajx7MdcfyVG06fLVTuOm0YcrxNs8H3zLk8TrRRLj
 y2vRZG/XYSoDtRBSaaaD2C/CEOPsRUnoKlqTIfgGwvhEmmek16YWzK+KI+sh5IRsDtq3H1lckrL
 kkVeGYBIf26BclCEVCYN9DImO9zVCx87bHDlap000sJ+jKQ6B7dNX2rzdnyXjOVP09M2LNo54nV
 B4mpWGWorOKR/74PzhcrIJW8U4jBDOtpXy3wN/CcOvAmIw8gkOXa6SKZRmqQ4LkNyfX3gvtPaR4
 XMzn8xIsNQfoXqRA4MMgKnuKvlTUwohMokVN7fSuEouA0y32kxCZf0/HKcLxr3pYphztnqNr63k
 iRLkyCoSuqmuPq+wBr9QhvOnwt9s5ralyNijLmHZcfnl0BJcKjESTvYqKk2onuu5C+5BFSun/M/
 A668YboqoN3Qf3s/yg1NIYO6jISfe+v7bKqUiWThxSvIU/hoSR11H/omw20ui5GzM72/Mv8Y8Tv
 BB/HL11BpfULi5g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7d146 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=RbMT-lXscSRh0E1VkaUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: rBRU027D4Xinaux-gyOIn5LlEddF6v3H
X-Proofpoint-ORIG-GUID: rBRU027D4Xinaux-gyOIn5LlEddF6v3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NSBTYWx0ZWRfX5/RlZA1g3ftu
 EziDywmMAfcrywp+tK3R2ZxsEQfNP3yCtW1eGeQmmksK05o0lTqD4Gv6RmEa5r6g/zSsV27XbGU
 cvViu4rF2mdxfyM8a1lRKxGgmTqxOniT8CYdMVE4fbvSW3DbezQQoIFmNxqHU9XrLQI4dr3ff1h
 /aJVdIXl7A/qFQbhIMp3+2lsr5hE3WE9DhX0QW2sTRsn5Cexy26JKONyofPuBprvLS/YRqmIsWD
 a3osnCrxlhVDwBYui4R05QkiCdSO72mDconvymUetiDVDFO451kbM6hHE2BYGrwlLr9ipcwGt1J
 2c6WAi36BwiBszGmyVdj18JDWV60SqLSwlA963l+Yx+MSYKdgXjnoU2LeAAiaEUZEk31JE9GKSZ
 TCh4qlORD3dNvYPE8BgLlkcw2zaEO1Z+Fb7/QgCj4RGELmBvPkRc0NYERm0kqJnrmBNMQqRVPgp
 X6QJScWTbaNa9Zk9//Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_094548_826680_339696D3 
X-CRM114-Status: GOOD (  16.51  )
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

NOTE: Each patch in this series can be picked up independently into
maintainer trees.

CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
module. The module itself handles GPIO lookup via the OF-node tree and
is automatically enabled on all OF systems. It does not export any
public symbols to drivers. There is no reason for them to select or
depend on it in Kconfig.

This series removes any such dependencies from Kconfig. If a given entry
has no other dependencies than OF_GPIO - they are converted to OF to
avoid new symbols popping up for everyone in make config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Make gpio-watchdog depend on OF && GPIOLIB
- Drop picked up patches
- Link to v1: https://patch.msgid.link/20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com

---
Bartosz Golaszewski (9):
      arm64: Kconfig: drop unneeded dependency on OF_GPIO
      net: mdio: drop unneeded dependency on OF_GPIO
      gpio: drop unneeded Kconfig dependencies on OF_GPIO
      leds: Kconfig: drop unneeded dependency on OF_GPIO
      watchdog: convert the Kconfig dependency on OF_GPIO to OF
      bus: drop unneeded dependency on OF_GPIO
      staging: media: max96712: drop unneeded dependency on OF_GPIO
      power: reset: drop unneeded dependencies on OF_GPIO
      media: i2c: drop unneeded dependencies on OF_GPIO

 arch/arm64/Kconfig.platforms           |  1 -
 drivers/bus/Kconfig                    |  2 +-
 drivers/gpio/Kconfig                   | 53 +++++++++++-----------------------
 drivers/leds/Kconfig                   |  1 -
 drivers/media/i2c/Kconfig              | 12 ++++----
 drivers/net/mdio/Kconfig               |  2 +-
 drivers/power/reset/Kconfig            |  8 ++---
 drivers/staging/media/max96712/Kconfig |  1 -
 drivers/watchdog/Kconfig               |  2 +-
 9 files changed, 29 insertions(+), 53 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260304-gpio-of-kconfig-e257ea7c9a09

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


