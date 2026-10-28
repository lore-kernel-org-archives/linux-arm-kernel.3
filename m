Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52FB606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hv/O9twP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5OsSv6c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=; b=Hv/O9twPEwo+OM
	+hGUuODi9pjPhl+LQnyxrGBrosChF8OITsZ4T51JV+fvVk369NtvdQTlz/m+jjrV+gdj8rXATXtML
	sWeC0KNxm2up+Tizt7yrQrGGvfeLfg58gNyMed7E5HUW1Funo4++b8ZDPFfGDuKpHUwbOPMjqeAmO
	VsYtmtmEYwQCMO8pqC0IpIRkhcLV7KSKRx065Efta9lD/4dchjBf9uBIlzB1L4x0qs7JeCsbVAyem
	6nnfhJEpdXlrMOdKRzP7XQXO3gHeUVDcDfk8c/fh3hc5YccrDtm7oMcqPKnDAM0JBwx3gzQfgV/SP
	1JsuQa++lje2OttBuXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsgA-000000062pF-1d6n;
	Wed, 28 Oct 2026 01:42:14 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsg7-000000062oF-1f2Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 01:42:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e93e0d86a0so583495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 18:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793151730; x=1793756530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=;
        b=U5OsSv6cLUSUHLCsTjdjnHbmn5oaSn+Q6Kc9VAqhMLWu+s6IurkJ+6oWy3WKttHXT/
         c8mEo7GujS5vqU4BXSHZtFY8uit0ftMD9V3CX5IwXeIKXaX1dMRfawyqdJr4suyvj0nE
         716J+XN5aO+yb92Mh0/m/TExaSjWJ6DQCOmBzoocrg1kCHSZoLkTAnolCA8jlDkha2Oq
         bokXCGPj9tR60s0mgtodr/yLiQqqgVFkKm+3Lj/fMkKRoR0bKKt0rPQ+yLHoQ740Qpd9
         1DdoU9DEZ6VPa+muryh0YmQsnR5H4FLpSVC7JRCIJn9Dkzm+AU6PrayHr/N5eyCdkZmj
         rR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793151730; x=1793756530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qFiHf0tIbDLVDz6TOJvHxKdyUmXFvOVRG/rMFDPZq0=;
        b=fUA/iNbZUIpEMj1XyvCdSJMnx7VC0atxQaGIv5pPb6ERwpussGvnnT2jG+CsXv/QdM
         U1t0PBz/jo96AY18/IIsMwzFvcAcHrye25KHIOM8EemX8O73MRGSVG0hTVJywpDXfYPz
         RpcG4ERf0PhJeGY6ltYk1f3teauiNoGLoSUy7m806KY20f4lrEvGbHg8+iV3tSwetG0J
         nvTddjkFkk7jB4YJq0CiuebWEmdJb2VDDXKD3rqb/ZS+vnA23+M+RGvqkeAOhArearhh
         gNJkTo6AWDoRyktPl6aai5Auq5U+JgnUmPeGABX/B1baIQsmja1/ZhadxxFU2bGTDXBk
         82SA==
X-Forwarded-Encrypted: i=1; AKwUvBwFzk12gYIi7Xk+GXb2MzebDwzSAC9LGXIArCerDQLxda6CHM5oZxAThgLWr7sTx9Op4e5Y8tOv0eF1kme3WgEY@lists.infradead.org
X-Gm-Message-State: AFq9FYJyDSQRs8oNUunxtTQH/jh1FFXhf3Oq3JavfEFVk8xg7TbxFqdR
	NacWg5w+wVxF9TIXzBnFDvAzCqdpVVrt6akMFmgAXBguZSNT5U6NDyWW9mxm1tLY1oU=
X-Gm-Gg: AYBFou0GKp98dkb4j1PhKO/r5/RTupifNMUc3rSKiPb1MZM884ur/4nHQcfwkRtC4ho
	GDy2QcIJrW/UHnusltRlFyxlSPeJjCGP1UTeW0SPepf/fuGdXwviPMzt6ohCLqfMinolmeRhoOp
	EKhhuhggEZwVYTNU2qI6YsuBojQnzKGnDucPUYEhxrcYlLjMXKwyUft1uXewEjXN+4xL8JybARg
	wKKI5z++nOvId4eaUkGHELW9LCSWANBzfm/Oq7G3f/mmeF/UC2QUuz4uxnF4S0FUeLWFLTf7c70
	e6WA/gOBBymrYyBdSloFG0g5gi9ab/skyhDBLu0cYAtxe4xgQVwxVtrzQnpVIIPlv7/1N34+tY2
	vkp9ctTA0lxCnsJC2PLDyTju7Wy+Am7aQSpuDwxgQgsObUQFZRObYVShZ2ckl9enXSCPsjoItGG
	0KCTIAwPiKULRfy5Aqcy1NkUncBLTumJuO4qpV9VyeRd0f7PsVczpAZVtwQA9yoMwWJbpQX1wPP
	/A9Nuuf+5HhN/5bP/s8ULLGrh2YP6uhfBUq/XoAvbhxFU+XsarMScatldTJtMcStiRGQG3fVJZX
	iZN8OAi8jfzICQGlrrsksra39dSCv/w9
X-Received: by 2002:a17:90b:3c8c:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3ae581811b1mr1020251a91.4.1793151730487;
        Tue, 27 Oct 2026 18:42:10 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm544338a91.10.2026.10.27.18.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:42:10 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Wed, 28 Oct 2026 09:42:01 +0800
Message-ID: <20261028014201.11057-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7b993a3e-d2b4-417b-90a3-a41d1f454cda@kernel.org>
References: <7b993a3e-d2b4-417b-90a3-a41d1f454cda@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_184211_432080_A6B36010 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Tue, 27 Oct 2026 10:56:44 +0100, Krzysztof Kozlowski wrote:
>Yes, just be sure to capture this in commit msg and maybe Sige7s DTS
>comments.

Thanks, Krzysztof. I'll clarify the hardware design relationship and the
reason for keeping a separate board identity in the v2 commit messages and
Sige7s DTS comments.

Best regards,
Jianfeng

