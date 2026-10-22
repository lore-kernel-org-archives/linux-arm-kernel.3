Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FAD606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rs8Y+bEa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YTrqLvmH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HNzWUauX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=; b=rs8Y+bEaJIVG3ldsJhznJSRxGm
	vnjmxzYqIYMQVB6SC7e3qq9gT67vIdtb/qs+zuXzj2pVwn++GAVCO0zCPasaj44ITMHdmp3r5brsN
	Jmxuls0OJy1iefmjeEBY2KkNvU5UYi+otpv4YK7+fYgHxnJnLHDmHQQVz717S53vA/4zxKuCByil0
	niKnQYVZLkBFmm7tZ7ofBMUSfzaNZVEVuUQS2955k2aTHPCI8rxzIpIFjF4ECG1EPqmnrAHk6d8Iw
	5/VQexq1RnrbyTSFYg67eRnMFalCoeFftF+srg60sgcD1PmEnSmTLy7Hi7r/VrnZNIRNxp0bVfZo/
	HXGWGgFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4d-0000000ELFc-2pzq;
	Thu, 22 Oct 2026 14:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4b-0000000ELFN-32Lz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 14:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=; b=YTrqLvmHHq6LvsVHhzG3+AYec+
	E6hULpikwbXDZooxtvNp0n14YKMvsbBCDV2fGKnIkKRVas87EhF2WdpeUJNh5DRb3Ozwu4QdY/b73
	XnKUgCPAbEgu+aHrdR0iH/mOoaxLoia6DJXp827Jdotnvu620PMkCpyGBvymeLBjChwrJMT6yrbtQ
	7ZzX3D0iqS47mZGg8Ijz8oc95ozzmm9gqvOkhpgJPJVM4BK3WqqPSwyUXzq6aRBexDSB8FzMd7Us2
	mkVsKqt09S4HmtXOAWIdeHZFEtq61octbb7fn0zzRSvsvomDU4PLgeoTeGHQv6YS0Nk2Xso5f505I
	EgIJNcVg==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4C-00000007KpF-0N7P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:47:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1351552f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680410; x=1793285210; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
        b=HNzWUauXIiyChV77T9N4PJ3vEWAoPKe3xntYe2LbDgljv7np38Ex08kSbsGBeP8GdA
         gTqUu4QcbKsP9oyuXm9+0wXB4TLxJkLiPBalZuu0R9tZS4fOA4m7SBEqSmottELznOsh
         RWFvKrmbc8Lqh8YuVvofKbM1Eb8vRbnyp2Myze7bGXs8kTdEH8ZfmBkbFnvy2jupMK5Q
         c0UkLceBZ1rgykFP6ZHBdvwyhxh0v/tAw96KbC2q0Otgaju67fJMSBQito1wm+CC9Ww5
         h1NBfH0YHZUOKuheeDO3BSDcAVekygq2q7pejFzQc5tyreekIwYitXR55bdkVHzt5gA8
         M9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680410; x=1793285210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
        b=2HPLD6Sai3pP0W7EBl47lrF5RMP7EGiOL9/nxvKdeazVoVkaMuwUTz8EJ101IWyr2l
         V719hKXfOslcuoxQWFklFVsOPq5TT2vJ77anh0ZW9CNk7I1RwLKLBo5JH25Viu48u6qG
         tOg/A0jdzY5P+ePSLsCboBlbOep77xF4j6fk9cTUZBZ+htARVmWj28Xii/j3VUv0gBnT
         AyOdwkxsUhM9A3n7dXC9zy0rrGqxNjgnuoP3vGM0mFUEONwvfCY7Gd+xSZEy/MCY57Vp
         5J578YsXZJlRBtHnhuGmm3gvgpub+Y6VElJ/suZYbcvhBW8T0z7n+esCrFE+q1T3w9Ci
         cChw==
X-Forwarded-Encrypted: i=1; AKwUvBy9HzN/nArq3d7OnKPB2Aa+FTmtYUl0bbPU4JfhIv0k71ervEQKSkNzIh2yolSu0hwqQj298bPQULpI9ry7jQO1@lists.infradead.org
X-Gm-Message-State: AFq9FYKq3SY2S3nbWDxOdEWyI2TTVEHaSo/WuuET6vZ9xXSrLX9c1ea7
	tc0ljXR1URJiv+OvJfXXjBBTDigt3t/dPkoAZEp8wSqnq57mJUEJpcmFYWf7Gfz1
X-Gm-Gg: AYBFou3BGfJRhqXyb6AVDU5Z87+Cr4/5mn+VsJWuczguFTJvQLjKzbympn7d/lLKa6C
	AATBxpIKtUcUJvIJ5MFIRb2qbsPGpwQM1zzJfEo/j/dDgOfCHub9kkUE7PqzhNc3osnOd43Slir
	D9sFaybzoZ27/eMDrSh3pFM5cDtbK2R1FKSYjOHCxW6W994kIfV4zInqe3Ypt7xXQxlplRAohdX
	tIY041D1yxHYekrfUle7TN0718Ct4o8COc0ztPnlkapAVXnitqDOMmqC+uHLKDtkQ+xh+T3gN3K
	gK2RbQmHhDl4aELB8DCH6tWt2MWnIfFl/fDGjTidSIWFrv5zac3Qo+1tWBrE7ODwvSUD4bca4ih
	wSYvqXj8rnycsLAoYB5hFUuYX8iS6SHdOUE7B9g4pg4gR1K2Sw0wfIfUbT+tnrndxbUdlt7A1F5
	qnXF3nbRaR9KNPxiUbiKWn6Dmt1L9ugzZnsr9Hjb+9yi1m0UrQzQRLHwDhjn/n59RseMutRD1xE
	20bc/GcUlaEJRjThObYAjwmWRohs1mxkBylfbM1Uy2M8M4yfvgV8DrDGp0hMpxUuVBE3vWb9YRe
	omQHyReWG3BYwk56gN6nfobkL0O6x83UeFsw/BDuzSJ1iTun3mv0W8bZW+ca0zlvr1boDjxPPLB
	N
X-Received: by 2002:a05:6000:4009:b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-48e264c9950mr11847583f8f.19.1792680409680;
        Thu, 22 Oct 2026 07:46:49 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:48 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Date: Thu, 22 Oct 2026 16:46:43 +0200
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQh2moC/4WNQQ6CMBBFr0Jm7Zh2gk115T0Mi7EdZRYF0hKCI
 dzdygVcvpf89zcoklUK3JoNsixadBwq0KmB0PPwFtRYGciQs8YQLhZL4hxQ0+rThIGTZC7on86
 1kclEbqGupywvXY/yo6vca5nH/DmOFvuz/5vVG2Qj/mo9BUeXe01wlPUcxgTdvu9fo6+R08AAA
 AA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_154652_910331_5B3B2C62 
X-CRM114-Status: GOOD (  10.94  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add OV5640 camera overlays for the Toradex SMARC iMX8MP SoM and its
development carrier board.

The overlays use the camera connector GPIO nexus, so this series
requires the toradex,camera-connector binding from v3 of the Verdin
iMX8M OV5640 series:
https://lore.kernel.org/r/20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com

The camera regulator is supplied by the on-carrier 3.3 V rail, which is
described by the first patch.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Include the on-carrier 3.3 V regulator patch, previously posted with
  the SMARC iMX8MP display overlays, which are deferred
- Refer to v3 of the toradex,camera-connector binding
- Rebase onto imx/dt64
- Link to v1: https://lore.kernel.org/r/20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com

---
Ernest Van Hoecke (3):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add camera connector nexus
      arm64: dts: freescale: imx8mp-toradex-smarc: Add OV5640 overlays

 arch/arm64/boot/dts/freescale/Makefile             | 17 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 33 ++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 ++-
 7 files changed, 238 insertions(+), 2 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261002-v1-smarc-imx8mp-cameras-8b664da20da4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


