Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4873E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u+EdG5AVyHNwIiF9DcSDNXkkUaDpmSGr2w5UNQ4/SUQ=; b=ZZVOG5ti8DdyNYBs2qyaGEFTTg
	79aODIWzLEA7sGrvrLOsoZWh2myYvLo9iv4OeH/5S4ZUYO1tCYFm8NeecJQcvZLnS0wa17MWT0bCf
	/UHFXpoFq+66jIWBjxYs7dZzzo8UaxWJBSCP1YC/15UQCM2Up1I6j4EGUi2EoBUJguiaRHdITuVMH
	MR3WsdGH9vCAFKLAUdYBQ1f5vo1uyO77UAFnou4a4fIWQp75zDM/RYcOx+IUJZsjTsUptTbIxHvSA
	fzPjjU7ulrvGMpRvhNxtjnA+JYUDpSgqPsvQQ2bIWnV6CK9vbjySRl2ezUblJBPwxmV0ifFpSReb/
	1Cad3Sqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyHk-00000003lBU-05Cp;
	Sun, 29 Dec 2024 18:45:08 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyGY-00000003l4u-3P7a;
	Sun, 29 Dec 2024 18:43:56 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-71e3284f963so4662888a34.1;
        Sun, 29 Dec 2024 10:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735497833; x=1736102633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+EdG5AVyHNwIiF9DcSDNXkkUaDpmSGr2w5UNQ4/SUQ=;
        b=GdmdnASGnQ1YH8Tw7obPwfsFDxE5JfUWDDwI8MYj4n/r1AmrSlFn4zCepjEjVM8cyg
         fNd1P7EP7HAvzg8Ic4c7NfkOa9YrX6jbdgfS+6X16eELP3JGuChK+acexMS2FXjMtO1X
         eZlKQkuVYunxXdsn6Ix35bymG36gzqS7XqKM5n70Vox48UjhSUo8pqQ9ijL6C8IMZerq
         Yqv29e+a0kHRML46omQp2unUxcsVH7wcs/tQ5wmHemsJUYGR6UFcgoS5PMoImZF4Azdy
         D/UT388y8BK2Xg4uDDIhedoPoSUnUMS4bHxm6iImAin3OBcN8G5inv1xqdBXQL4qzwqb
         KcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735497833; x=1736102633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+EdG5AVyHNwIiF9DcSDNXkkUaDpmSGr2w5UNQ4/SUQ=;
        b=LlP96zoz6PMx3dqvsuQkEH4xQScQ63iSts8iapK4ZQK8OI8eAFZ7ZkXD97sfvaQ1sB
         NcufNv3iInWFAWULI1MWquXzeL3TuDGikZhRN6a5IIuo8LpS9dFDUoDvZlgn8z4t21dg
         RT8i89EU2x4JcaD4NY0DYJJMLrXidp9+3r/sMjyji1bwwzXEQtbL7PvWORgVUKimEbOH
         oZyLfEzUwMtD+fIZl58yarjDsQoSwX4vXjdx5/j/rUtoeLJFzClW33X4ueskGnt3TMJq
         ODzkxIvKDqqRx+IVuWraxWPG1h6D29ayn8UklGH5EcMA8DF8IU19rr2UemoAvdKaP0kE
         ZtOA==
X-Forwarded-Encrypted: i=1; AJvYcCW2TF8UzEUXU/EKQc0twop3dYXQ/a35PuIj6QVtc/1g70T/r2Av1esidJmnvO+fIlaieZbmvVNi8XSJvECbzVs=@lists.infradead.org, AJvYcCWHnP8F7A3UAHGtOBcSNKl4CC00SoqK59QhsJiwVCGo7EVMpbsG7QNij9cFew7+Oi0yTTOkoWmGVD+h4dMcknEW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpfgt1CC6J3mMCIgDc8fxti1cO5qdsf51LNEKVl8TcLIh7AbWx
	O/rpP7meUjPIqWbneNCPgya8U1TJtoAWnG/5UvC6au5dFFrl0egH
X-Gm-Gg: ASbGncub2z9DVBacRgiJqGVjUn224zQlE5xQj00K2OphZivw836uCgx2KrZgEMcP/N+
	RyK9R7K1J96DtoX5VS7mXgx/BkPoGvrNKBnUlNS2vk4bpEgPm28KdtVJD0RHGSMHh8YpYMKpBha
	HduGZDSQGtqPIvQXu7Qfl880Qt2v6DhYKu9tns87/YxTHVAmdx36d6DnN2286sj/0mrJThZFFnd
	SywIYoYdTc3NNuyZ3H3BsKHHEN9xM6jKUU47SNa+pe4MTLC3E/eSMBWeLjLOfpp
X-Google-Smtp-Source: AGHT+IFX5tXXeMQ27jrDhnaZ0ipObtd0vNMPgxqr9NK5Gmo3CLw+ebz1oX7nKY0qSeKGYla2nBbMeQ==
X-Received: by 2002:a05:6830:6f0b:b0:71d:4b55:ae20 with SMTP id 46e09a7af769-720ff7fdde6mr22770855a34.6.1735497833186;
        Sun, 29 Dec 2024 10:43:53 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:e765:a49c:5c4:1103])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc97d6fafsm5515645a34.31.2024.12.29.10.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 10:43:51 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v4 0/7] arm64: dts: rockchip: Orange Pi 5 Max board
Date: Sun, 29 Dec 2024 12:41:25 -0600
Message-ID: <20241229184256.1870-2-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_104354_846695_221774D8 
X-CRM114-Status: UNSURE (   6.76  )
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

Changes in v4:
- Orange Pi 5 Ultra was released and does not use VP0 to HDMI0
- Move HDMI0 from common to the board level
- Make DTSI to be shared by the credit card sized 5 Max and 5 Ultra
- Updates for the newly submitted HDMI1 support
- Add Ack for dt-binding

Changes in v3:
- Refactor to share common include with Orange Pi 5 Plus

Changes in v2:
- squashed commits together for initial board file

Link to v1: https://lore.kernel.org/linux-rockchip/20241026100310.52679-1-honyuenkwun@gmail.com/

