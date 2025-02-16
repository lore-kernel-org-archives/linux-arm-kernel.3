Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B98C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7e8sMABN2b7K5nBtyYMhJN891hqdkLBfQA9iEPb1kM=; b=J7aatN0kY66lKwPLQp7hsP+LET
	xiSZQ+wKSqcfGK0o6Qqa9mXXd5lqEugCUsnIwRKJXzYX5L+TDVGPnqiYSdKYOrMBoUO19+4cgaJVM
	kyYOcj7XJtvNKRiloIWQAmH5Q2Lo1AsmZ4gJFs4sI9TKKdNQhLMnXFhQEHQmKDsClQSXUnMTFGgGd
	5LX29vWwhELMCDH4/M+BIkltROQNHgjASzgmMtessfyNYaCqZb0obcEhPcef9scjI4Ve0v7PZDApv
	rkaGuLvNFq1Bgl2TBo3PjlMQN8FCAU/ScRbmbdmdWXgQH0pwCBHKXV3qZquXchjlUCVF6d+kJ3rFV
	QFycTBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjf2v-00000001t6K-0qtB;
	Sun, 16 Feb 2025 13:50:57 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjf1S-00000001syY-3ANJ;
	Sun, 16 Feb 2025 13:49:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22134a64d8cso168645ad.3;
        Sun, 16 Feb 2025 05:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739713766; x=1740318566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7e8sMABN2b7K5nBtyYMhJN891hqdkLBfQA9iEPb1kM=;
        b=EdP6dKCT3voZeZ+irUdSmz6xg/05JjdMWnXBNp3RLdys/+ZYtKDokpa8p2zjtbdFMp
         g1EebdF/0rLJqHwFNvuxRxSiqU6VcVgKQum/KQQThptDYOlm6DjmC7Y8HpwUAVIHzlsV
         tHFgtBqb0ThMPynuX8kBDQzKtflLoXs0EDa3LlOYDZ3cea2JtWBWdSLHIBkakAXHuLPc
         dUfvVDRAFqqoe4LDSPmMPDLyPcV0gIvWeq8/kolHpVMq/t/CGK1sM+HCPoMu3nfMyrvd
         aTzoLY+9jYtuJHV5HWEdMvS93f03a0UT+gH3C4pDCpsgGQDjFRnkucdiGSR92D1NLBWx
         FmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739713766; x=1740318566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7e8sMABN2b7K5nBtyYMhJN891hqdkLBfQA9iEPb1kM=;
        b=B0q0wQ84Q0qNp549Q52HH5IRNI5NdLLHM+OBO+T0NPKgAklcSRz+vBjzsl6z0BFDgq
         qXyMkABm2aSdbaScYya7RZbWyrtwdQYqsiOhA4nh3qJ+UepEKMUQ+Kk90vJhYiYE30wm
         /lYgAx7zfzVVKmNLNaw70/2ZhM/daqhCLPNRWuErvhmJUQwWz10UQuIin4qcacmIJvYU
         j9C/eEEN0cswVYYgCxqPTgiwO3yYGdcwOg/h/2wRvrxdX2inOIctQPrebzuPuVAzye9N
         VWppJ03a4yo74JBE3eBJSA/MNF3NldUDKFuXjkhDhdGGU4C8nuke9ZBBE71Qbap5G7cq
         UYtA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Xw+bukeyLszv+9I9vFnypg9J7pKZI3AO7IkzYFm4L6YSlU3rHpmF4DnIfHnSgAY0MyfbDNUfnrPmaR+6WQON@lists.infradead.org, AJvYcCX3SC5/nElecrY70vZPtSJWo8PtoGLfYObKgyVFA4LjhW125cr2ZsPXD+EPICkCDc7GbRXLkXMSmwNfRFjywgs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRDG1P2L/iDFNQSZ9vpvA0wylSACM4A8dw3HM/Eih2MQmmOjRO
	QjnnaIU9aWTyocL2liAQ3bPmyqmGbKxmD+bG/K3bqvEIXdZYe7Rz6uTg0QnI
X-Gm-Gg: ASbGncv88Fq6ybd3+ofdBNli+VCVvi8WtZ53KwzI+m2N07bjIcx+dr0eDdZ6zukeo+n
	OJDVMODerGwYjNF5NKr2V9ZbRsD7ksPoshSvz2VIs51kpspa9EKR2cr+RxVIKeevo1/Y6/kEE0F
	ZID1hid2h0u6JXQXl21xAu2gxKbALqfs++d7Dq+PsGzEr1P/afGtH/cE3sDSXQBIRViPzJ4BBt+
	JQYVSUtEdilazTpt0W5thDJyBK4dTQbl3MpB12BjLwTf+bdbzkFQ7YA2FmKwYLVLQAjBUOv6j/f
	hszdM9sf6FwKoKDIpzlr
X-Google-Smtp-Source: AGHT+IFXugIHaSfIg+wP+gViyrZOahiwtYnx7ACfVX1OGYP3jnCr/KLLZZXjEFpO+K+dZuGLwR5xtg==
X-Received: by 2002:a17:902:c94f:b0:220:fce5:977c with SMTP id d9443c01a7336-2210402b42amr36437495ad.8.1739713765745;
        Sun, 16 Feb 2025 05:49:25 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349056sm56776745ad.22.2025.02.16.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 05:49:25 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: piotr.oniszczuk@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
Date: Sun, 16 Feb 2025 21:49:17 +0800
Message-ID: <20250216134918.1357069-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <566E6F11-765C-4415-8805-55DFD3C2BD4D@gmail.com>
References: <566E6F11-765C-4415-8805-55DFD3C2BD4D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_054926_791794_5DE86578 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Piotr,

On Sun, 16 Feb 2025 13:37:05 +0100, Piotr wrote:
>Is there anywhere repo with this patch applied to test it on rock5 itx hw?

This patch is applied to 6.13 and I was testing with armbian:
https://github.com/armbian/build/pull/7829.

>(asking as I can’t get it working; even with hdmi1 only vop clocks like here: https://gist.github.com/warpme/49feadbe1f53ea31fca76f41d5bb3ee4)

vop has a dependency of hdptxphy0, so only hdptxphy1 won't work.
If you are testing with 6.13 or 6.14, you have to add hdptxphy_hdmi0, and
if you are testing with linux-next, you should add hdptxphy0.

And I recommend testing with this series since it adds more display mode
support to hdmi1:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=934232

Best regards,
Jianfeng

