Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D16CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkyQWYlswEIA/awfOx7Ojl2ZOMViZ7vIFKeJUQPM2ig=; b=Mgw8lvtspq0fJCO8htMXcv8mpa
	FPSljBiWWi9+tt+iOWGHlZTBVAc+0uJNjNXTTVCiJOWpvo0ikPeZyBodmA0MlK3Ih8zr5ucJnluPd
	LYw72csxet213h679L+svShDyX3FPX77zHnQhAMHVkH1DVj+3l1aNkZMRtoY3SjpSVRuwTpHOxvxE
	SNaVv4otofzzZleUUNBQx3mC1GnHUlQES3/6qLpRoHWtBnY/ohAu1+szCZ4o+K7HFj5tPxQ145RCo
	fOw0lbfFSg6GhWK3urIjZJzQEK2La/rQlynmfK6YuZY5sge4Vz76ZLJdb/aOpBsPnR+PSMrSL5a5r
	kf/WccAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaxiJ-00000000Fnu-2tTn;
	Sun, 13 Jul 2025 14:29:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaxds-00000000FSr-3cqv;
	Sun, 13 Jul 2025 14:25:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-748e60725fcso432971b3a.3;
        Sun, 13 Jul 2025 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752416724; x=1753021524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkyQWYlswEIA/awfOx7Ojl2ZOMViZ7vIFKeJUQPM2ig=;
        b=Sycv70jtYHyIAQAsjvystiYXTT+fOCR4V2GCQT/3xOGuQ8tiDv+wB8/mbAUr8s5hcL
         Hq4oLMf1Xw0JQkuseaHcBExCk+VSuJPZ974kBxYHsQqti2GDp25xsIkf91TdD5PMrrK7
         NSyRLftCyJobVKOMNHA0ktxaikQ4JkSGSJDLHqlIi2Y/RWjEKht7JE2HIARurXLseFv0
         f0ZYkXFG5w8faIHaGVnqVC1f1v9c4tLClTVdNoWpNsNTXE6F851wHgqMSNwHpMfpfgtK
         zMgD44WSJPqM1rJ3ljYmOfT+/VMD1XOCb6ITTLmrPXNa/tXi55YFpWMJBFeMQm2He7Tc
         Pq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752416724; x=1753021524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkyQWYlswEIA/awfOx7Ojl2ZOMViZ7vIFKeJUQPM2ig=;
        b=lshhLbCod2w9WSRkTXwnJB6W5ME39NQcUYmDARilOxbXLPVmYNW1C6B4fOTjvDp6jd
         cqawQI8HIjdp3ms4iMpGJlnBwmGYRkLYPe0jEnkPSVxWkyLmCJ/bGNQ204pKUla/DWa9
         U7umbvWz3gjyB1SxJxAzjE2gV7q94QY36ANwX/qyyuvF4nw3vHi8MTy8TPef3tnxleHx
         upV46AyXWAoZIqZ3yfFck3LlrSyl2TPwebgi+yH9nso9QkJ6Demt+7Va4Kqk4B1/AI8D
         pqM2rVWT/KqkJji8Vpit3I4q+0XCYyAci3IKQs9Hpo16xCHV4gM+9NchtfSegC4yWGJd
         SMhw==
X-Forwarded-Encrypted: i=1; AJvYcCWsnbE+vyI9GJx//l52GreOIg04RaLLmTu1TXGzbVL4tf03K3DPDzm3MrUdNOzSaTqAcV1NarBvW+xwrWmy3Yk=@lists.infradead.org, AJvYcCXrzhhfQVpbq4zn9y5kd8Ok11oiZP5suqL3TsmCmg/6F+bjeNCHrkdBX9QcCjX/syROeiP+U0HBPDaWojHt1bvv@lists.infradead.org
X-Gm-Message-State: AOJu0YzvijTG+CWZtKf4oGpZLdxqKW17bUQtgxLof2sK8BdDe5mdnSeD
	akUX3XdgmYFdP3AADNLoaB+f4ID8dc8CwHK13j2Xqa89SnBDyMhsXZ4dxAx1Hm4h
X-Gm-Gg: ASbGncucdGoV7vP2KK/f/kTTQDqCd9UyTjxeH6imJ2e6FfDCcV3+ELjpw+37hyuSDpY
	oRMSHmTEAOE8PD2ulCss0IhUwdEAARqKpulJCGqNjgQKgxFevzkIZWWMZUHMVp4rfr3gyFmgY2k
	fJ0FSuEc6asvLcHtrQzxh5EqWrXfuyde2a+sx6haGn+7CLZ9lpWtXXY1K0X7huhPsSCEh9nNZa1
	LfYmuuFv82Hfhhb8JXTapyNIoHruEVRnlvbLhzEuVYjBn5ZtJoWowL4WN72XUapceqyqtyFD4Ep
	rNQqcW//DyyZ32yMiHC8QKRSopmZFOGGyPTLN6KD0SGH3V8YIx/o88ESL7u3Xt/RM1re69FLu7T
	1WRk+QP86yY0x/ec5QhzKXcLvIE8k
X-Google-Smtp-Source: AGHT+IFe8Nke6gA7rUZjK0GXgdQSkFeo3RLnI6nP7zfSRLpGatQXNVoWZbEIqke10QCKsGdaZplJwQ==
X-Received: by 2002:a05:6a00:b1d:b0:747:b043:41d4 with SMTP id d2e1a72fcca58-74ee3b110b4mr3471889b3a.4.1752416723683;
        Sun, 13 Jul 2025 07:25:23 -0700 (PDT)
Received: from rock-5b.. ([111.172.109.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd7140sm8810149b3a.24.2025.07.13.07.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 07:25:23 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: heiko@sntech.de,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	nicolas.frattaroli@collabora.com
Subject: Re:[PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Sun, 13 Jul 2025 22:25:14 +0800
Message-ID: <20250713142514.56742-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708151946.374349-1-detlev.casanova@collabora.com>
References: <20250708151946.374349-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_072524_906448_92D506F1 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Tue,  8 Jul 2025 11:19:33 -0400, Detlev Casanova wrote:
>As there is a considerable part of the code that can be shared with the
>already supported rkvdec decoder driver, the support for these variants
>is added here rather than writing a new driver.

I have tested the new series on rk3588 and rk3399 with chromium. Since the
HEVC decoder need EXT_SPS_RPS related patches, I ony test the H264 decoder.
There are two issues:

1, The decoder max size is detected 1920x1088, which should be the fallback
size when queryig VIDIOC_ENUM_FRAMESIZES[1].

2, Playing H264 videos ends up with green screen.

These above issues don't happen with the old rkvdec2 series.

[1] https://github.com/chromium/chromium/blob/138.0.7204.92/media/gpu/v4l2/v4l2_utils.cc#L520-L533

Best regards,
Jianfeng

