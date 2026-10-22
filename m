Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2AF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FjUSmMvB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0/T+L6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hJXOwkkBJmyzw8mSfRsieQwN95oGOjBRB10X28KVVpE=; b=FjUSmMvBz/j9WwtSERQxhFNJLx
	VCt3bCa2qB0oLS4c83rbIa/23OHqBICwN3ABbGr1tziyXXiPi7f+h2Uyk1gn3hHavEavgHlm+BzIc
	/+4TTgqKm2G3aP86DDxiHXqPY2lz19stJ7Ak0NMG/3Zp3JFQb//WEEzF2Z2FbaXOWaZ/lG+ByZlnf
	2v0XvQxKZovU3McX+/spP/IkemdLEYrflC7jk/AiHr4G1568v78+Pl+TIfWS6lHqz6bZAQ3E3na7O
	uBBVIZy02Q2I1Qzegemc8x4D711NRSS/6RLAxZJbwH7Q6C10HYmCmK+C+bQubazvntrGikIAeREfL
	Dx//a51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsIv-0000000E6mK-3nGc;
	Thu, 22 Oct 2026 12:53:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsIt-0000000E6lU-18mQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:53:56 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso188136a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673634; x=1793278434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJXOwkkBJmyzw8mSfRsieQwN95oGOjBRB10X28KVVpE=;
        b=R0/T+L6BauD4b0iCjj2SLt3oiGUxvVqaocQX57SUOknivUq67QQeuSj4Uswmda1T0T
         PTrgN+uGkILMHO8YwxSld/fV3cmNzHRan7nc0e0cCpabNbEBKZWOiWatDDuQ5Q0aehQG
         R+raCzZjInfmF1ic4rck/M21TxeAT1jNCm2JeRBsz+C7x7tsWQUNAzxdN0URUo930sJP
         VYULvLCJWDFPhfz9MgxAmowYBmy0wQfQ5IYyyJ+SvNrd+qFv/W94Wz1DDEzCqMzDJEt+
         WV4cvOkonLNFTpt0EaxpMmKnXuQH69v302A+sRAurz4CEcP45xlPEpuW39r29H8iEVMw
         N80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673634; x=1793278434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJXOwkkBJmyzw8mSfRsieQwN95oGOjBRB10X28KVVpE=;
        b=YzB2HGIpfTRdYhLdNx/B+aYaUyH5+6Z7ki8QdOvAmcpxKhNM4ZNF5rL9dWGh8moZb8
         h5JSSxmB6ZRMA+EtdU7rZ5d//7UN/7bvZlHWPg6T1g6kYgoJSmJdegPeuAcu8+LZMKnW
         7OKUYYvzH/LrqslYVmBx8J1bQ0mimGpbzisA1XBsZg5YZgWTiPsC4kE1od2zJTJF03uK
         +J3JsxFO/JXNpz7mQtGpUBqu7u90KN/ULc7l8aFyquhl5mdrQ961X4V8loMQrVMI9ujN
         PYUWf4POy5T7wGVS7RA+2pVLyWNd05CJKPc4694ApGV4EHD4ZWMQdjxyW8QoFrPHB6lN
         eyrw==
X-Forwarded-Encrypted: i=1; AKwUvBzPtc07T8W/4Reb5PmvTrFxCRNscF5AmzwrwbBM96zrTIndbLz4iDYMyTMz80Alk+9TwBHTtey/qTXIH7mSJ4Km@lists.infradead.org
X-Gm-Message-State: AFq9FYL2+/7G3HZ/NGCQsKMNewNPjwKk1NNHZo749GxTKum+ap3JEiVT
	WI7+PW3MUN1fMYuzO9WlypKG0rw0EntmOcAR68wHDNMW+v8LbPhQFoX2
X-Gm-Gg: AYBFou27UHnD/+v+3NoRf+bCvLSPyumx4Xsh4KB9La0VfZ2NUzUEmxB0NjEOx+DXIpn
	NoJRU17IStppFYOyut/fTsfmdlhsaek1qzd2zbyQ+vXJsJoYQbuwagTr5nhrf1S+u3yVsss4Hfl
	lLG1b+m5/GXHAYLF92embEpXBhpWL9vzmE5f0ctyo6ZbTd1QrfoZHcXvawceFiu/DVhsc0J+AOl
	zGB18t/VwRPKipLzBsMkNi3HrR7SWxmoTW8LsrobzWTlv4u0Q7idqoVDNfh2P9IkAgltO0RHRQZ
	wUtCoA+CnU2rPa1WDXI+AxJ/Buz9XL9Jo4WNhlAzVkr5x+Mre6Qp3sSCXeHSTM0/DZYW+dSI4UE
	umonNJMyZakPVHxUez/keHs8kSKM+TCDT/ftddo6zhf9UPNv+CZKe7beupG5nQuV8zC+3WuOvxY
	Xl4eeP5vyVYQPjuBl0mYJ90IT0SSoKtwxbxgaMK3U6Qh3c5iRdZ7EkME0CyXaKNtJLUgyqrMm6q
	38t4ZdzaENzru2bzoXeqnOAux5mJT2FgJVRx/3j3Wg3Yty3eXP1JWw3tlk=
X-Received: by 2002:a17:902:da81:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2ea43ccf96dmr64409565ad.2.1792673633997;
        Thu, 22 Oct 2026 05:53:53 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:53:53 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add ArmSoM Sige7s support
Date: Thu, 22 Oct 2026 20:52:51 +0800
Message-ID: <20261022125339.82746-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_055355_302377_723CD2B2 
X-CRM114-Status: GOOD (  14.88  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support for the ArmSoM Sige7s, an RK3588S-based single-board
computer sharing its hardware design with the CoolPi 4B.

Document the board compatible with coolpi,pi-4b as a fallback,
extract the existing CoolPi 4B hardware description into a shared
dtsi, and add a Sige7s DTS containing its model and compatible.

The generated CoolPi 4B DTB is byte-for-byte identical before and
after the extraction. The Sige7s device tree differs only in its
root model and compatible properties.

Boot-tested on an ArmSoM Sige7s v1.0 board, which successfully
boots into userspace. This series retains the existing level of
hardware support provided by the CoolPi 4B device tree.

Validation:
- Build-tested both DTBs with the arm64 defconfig and W=1.
- Passed dt_binding_check for arm/rockchip.yaml.
- Passed DTB validation against the full processed schema set.
- Ran checkpatch --strict: no errors or checks; the two warnings
  ask whether MAINTAINERS needs updating for the added files.
  The files are covered by the existing subsystem entries.

Product documentation: https://docs.armsom.org/armsom-sige7s

AI assistance: Codex reviewed the series, ran the build and schema
checks, revised the commit messages and cover letter.


Jianfeng Liu (3):
  dt-bindings: arm: rockchip: Add ArmSoM Sige7s
  arm64: dts: rockchip: Extract common CoolPi 4B board description
  arm64: dts: rockchip: Add ArmSoM Sige7s board

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-armsom-sige7s.dts    |  10 +
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 936 +----------------
 .../boot/dts/rockchip/rk3588s-coolpi-4b.dtsi  | 941 ++++++++++++++++++
 5 files changed, 959 insertions(+), 935 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtsi

---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
branch: sige7s-next-20261020

-- 
2.47.3


