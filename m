Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fX4fFUAs;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tJfDQwHI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=; b=fX4fFUAsj/Jfn21/R+LDi9LuFb
	17kXrqfkm6DJIvynIuKuVDRLcXfCfE7JTYaKxLIEiU7lWc3rQoPD63ejA/RK8tXz5h5iQVleQl2Nz
	29uGmIqJpxW9enP3w6KahcZjB1bAshZ176XkAFmRPy/8x1tTOzjXQN8D+4iA7e3EiU47RS7CIT7fk
	YiezMmdZv7MLmn/x9s20oj/sUX6Jb4CqWY7RGm/EZ4/2IegtYCXXwD6dVR3Pl2+YLza3ga90Q00R/
	0mx2Cy+RlCdhEeKhz3HgeJ1/6guztRUrz68dHXL/apFTSBMEGKmKdzcYNFl1HNV5kAydUf3oXwC4b
	zy5F995A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKDpT-0000000GFrS-23FH;
	Fri, 23 Oct 2026 11:52:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKDpQ-0000000GFqo-1FVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 11:52:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so3402105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 04:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756374; x=1793361174; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=;
        b=tJfDQwHI9zvmQ9WMtUd9Kmto4zkldfyl2oVybJaqIpnI8RPUJGNbEP0YAfHWjE9zpw
         tMmTsOqtHSuevslxKF9fS7xpAHrsBhYKkxxGhj7ZBHEubOLTOhWOLNgZbwxDHGgTM7p0
         IOuczNNxAhqkK/qZQL4yqyjhbh52MgIWrRXkpWqdW+p4tkTrMveM8xLu6zdIEtB1qOH4
         8jGd6IPcUFiBjyTNm1Ei/PmZc76rwzGG4csYBWlIIGRWH9bvENglJYjzpGEZnZ59atej
         RKp4crJTUQMix7YjZ+2g8nwygk80mp+t+7rDk3DMh+YoIgQtQOaL9hvGN6i0Kf0Tn/u1
         n6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756374; x=1793361174;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J03TI8MCNYKa0Va1UVEBwFeBVNvHx3CWdHxIg7mHyDk=;
        b=SNQjOXV7QR9lps5Odcf2UgA1S1am/a04xJNP334yv0tOzeDqFeJXQeNiU/WuFmJxUV
         ZWohAO3Y5ibHtj9Dtf96pmJWzsrX/SsPPjFyfv65hVRwSPGxozelIX3X5Nm8D2iBX4DD
         6031P+P9XZYuofEtltLX/CSMmJ9wL5Eb211Cm37mIko/gB2kCrq6JnIS0Mz8awdOXAqe
         PTVXNGTbd9uLpMl64ccCYjMDGbMwU+I0NAAlrzkmBc0xh2T4Dbo/PUa1+O4CAey+PLDS
         REMYQCHmeQRZ36M/7R3dWwFPDwAXIx4qfpztmqJUcfKWceF4/qayemQWyHTJFvWJkO9u
         XJWw==
X-Forwarded-Encrypted: i=1; AKwUvBxswRe3cmtWiSY5nCw/mbPgCrue85go9ocvUiiPa5BFNTeJbCBfsc4XlDHUQgrioYbGc40xSYnK/1hWH95twJNN@lists.infradead.org
X-Gm-Message-State: AFq9FYJkAkJ1kQMl4MDLkgXTPmwj9WLj1fMt77ecTp0zMWxjyliLAFOh
	Rwk1GZUrtuRM0QppL0CdtBEptRAWOfevr6alVWEXsxj1yjciH0e7tfZf
X-Gm-Gg: AYBFou1/Wtj+x6TXEe78XcYqKsQ3zfdPoq0WTXtxtNEk+mg1HpFbvY0egg6A2n7vbCS
	nuYhAizvq/HojEUkBz5akHAOoRyiNDi0DIauB5B8T/buA5fiXxdLoQys2MNys5GkbpMJfbsBVb3
	bOpfk34iHUJYGjTVF770AX8QamsgLsowghE3kYy96tsOY2Q4+wFIbxLLhk3e1QQmjr4gRedC44i
	AvqsyWvn7k9kPvfrWrdpDJPC16AVODD+x7kz6BOCpUyaf84gKqTNC06X5hIVeYSFUwPS5pLLs8U
	Q2+YTA8Y+oV5E9S0soOFdHbzSoOCf4d+zUaSMw/S/rph2g/CVR/3vCy6dhObcEVEgd1AVx6w9Sa
	Pp26qgJuuAnmc/G3BkTNQQPHld1usfeLw5bUgfyjsZCz83bTzSFh9O9e0s4eGB2GCxdkDTHJhBx
	YSNbI1ZKCD6NSZQXFqUJpJ9kzuMSIJtsh21Ned11wsLYATFvPdwb5aQe7R2K0TvxcYPcfFHBzPQ
	6wkz5mKQPBZTaTyJoaNL/VHD6qLx06dQVIpZaMEX/3JUBLYwpcHmV2sLPrw5JEORXC5zN6w9G01
	r3DwDTFE1koEs9YCQod7ZMwGgkCJk3q0NbYAaJDAh04rrLO2KecLNOwLroIpkUgnbwo7+pY/FYA
	=
X-Received: by 2002:a05:600c:c116:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a211dd9423mr26760585e9.32.1792756373823;
        Fri, 23 Oct 2026 04:52:53 -0700 (PDT)
Received: from GLaDOS.station ([187.13.215.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm83319775e9.8.2026.10.23.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:52:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	pierluigi.p@variscite.com,
	Nate.D@variscite.com,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [RFC] arm64: dts: freescale: Supporting Variscite SoM and carrier revisions
Date: Fri, 23 Oct 2026 13:52:41 +0200
Message-ID: <20261023115242.11197-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_045256_378765_C20E9F33 
X-CRM114-Status: GOOD (  12.40  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,=0D
=0D
At Variscite, we are starting to look at how best to maintain upstream=0D
Linux support for multiple hardware revisions of our SoMs and carrier=0D
boards. We would appreciate guidance before settling on an approach.=0D
Our goal is to support new revisions while allowing customers to keep=0D
using current kernels on older hardware.=0D
=0D
Our platforms are typically described by a SoM .dtsi and a carrier-board=0D
.dts, for example imx8mm-var-som.dtsi and imx8mm-var-som-symphony.dts.=0D
Both the SoM and the carrier can evolve independently. Some revisions=0D
require changes to the hardware description, while others may work with=0D
the same DT. Over time, this leaves us with several combinations to=0D
support, without wanting to duplicate complete device trees for each one.=0D
=0D
What would be the recommended upstream approach to organizing and=0D
maintaining these revisions and their supported combinations?=0D
=0D
One possibility we have considered is keeping the common SoM and carrier=0D
descriptions in .dtsi files, with revision-specific .dtsi files extending=0D
or overriding them, and small top-level .dts files selecting the required=0D
combination. Would this be a suitable structure? Are there established=0D
patterns or existing platforms we should follow, particularly to keep=0D
changes for newer revisions from affecting older ones?=0D
=0D
We are also wondering how to handle revisions that can share the same=0D
description. As a concrete example, we have discussed the following=0D
possible grouping for DART-MX8M Mini and Sonata:=0D
=0D
  imx8mm-var-dart-2.0-sonata-1.0.dtb=0D
    DART-MX8M Mini v2.0-v2.1 on Sonata v1.0-v1.3=0D
=0D
  imx8mm-var-dart-2.2-sonata-1.4.dtb=0D
    DART-MX8M Mini v2.2 on Sonata v1.4=0D
=0D
These are proposed names, assuming that the same DT correctly describes=0D
all the hardware combinations covered by each entry.=0D
=0D
Would it be acceptable to keep updating the first DTS to support a=0D
compatible revision such as v2.1, retaining the v2.0 filename, as long as=0D
it remains correct for all previously supported hardware? In this scheme,=0D
we would add a separate DTS/DTB for v2.2 only if a different description=0D
were needed.=0D
=0D
This is an initial idea rather than a settled design, so suggestions for=0D
a different approach would be very welcome.=0D
=0D
Thanks,=0D
Best Regards,=0D
Stefano=0D

