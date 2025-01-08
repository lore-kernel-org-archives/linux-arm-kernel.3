Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAE8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFo9cWHgR393ogE0aZH9y/o/T2naWMDJpkS8Lw/t1YU=; b=tOE+By9Mzn/Ra03fVh/H2dtm6f
	a7c8jVUbbbO8AiUm/e39zIfCS5u4GcdFps8boZCIR7HMgOh1xGps4q6HwJj14tDjEzjb6amBgw17I
	sQiWbcZ0xNeQVY7V2OAhhQh6vmPpEk20sgoZoj6Hw33/eSdK0U4YtKjs8Md4Hs/Pojovp2WCxK5Tv
	GeVAknLGrH/J9nm/NyQw/yGhIIikvqrq0KJZiW2UXPOsdQlezkz0B10h3NcigX+u47FVWqZAsP+24
	vUfuyWbgE4qOzZolo/0QapeblR4oVwN41kSnrt42h5FNZN9PlgwSXii7QquZkt/Xgk8uGqPC4GTKG
	XbjORFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVqp-00000008YwY-1C3P;
	Wed, 08 Jan 2025 13:11:59 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVG8-00000008RXZ-1rlm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LFo9cWHgR393ogE0aZH9y/o/T2naWMDJpkS8Lw/t1YU=; b=jjP+UZEMLeN5JvVwWrvA+03KLi
	0SzE+Q76z1AVldJRDdAsVeyZWrBaMTldlNtyDaYSl5mIeFk10hrf+l7wM5FfxtFCuDpC2+JXJ9QYl
	oCCA+uSHG3DCFuPlBqG+XS/RG763UHQc7TaPA3m2rMuR2SA3r1tnHSJMjCQBRUGmqdhyD36tmO6D7
	U4dA3FhSDZVW9D17faX08iYqOfYGLj5yP2JvjN28tPiMvmUgRAdpcMEe+6jw8Z8JuZ2sRlHUHRkN8
	/3+/G48uEDxWBHPggh3rLZyH9bdslRaqWZOHvS8OrSSctFw4WP9J9QCgjFFc5bTiRNWdT8r07ME29
	BLffuRmA==;
Received: from [122.175.9.182] (port=52432 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tVVFQ-0000JL-1b;
	Wed, 08 Jan 2025 18:03:20 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
To: christophe.jaillet@wanadoo.fr
Cc: afd@ti.com,
	basharath@couthit.com,
	danishanwar@ti.com,
	krishna@couthit.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mohan@couthit.com,
	nm@ti.com,
	parvathi@couthit.com,
	pmohan@couthit.com,
	prajith@ti.com,
	praneeth@ti.com,
	pratheesh@ti.com,
	rogerq@ti.com,
	srk@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: Re: [PATCH 1/1] soc: ti: PRUSS OCP configuration
Date: Wed,  8 Jan 2025 18:03:11 +0530
Message-Id: <20250108123311.9501-1-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <352592c2-e1a4-4d42-b1d2-f4b87ede2974@wanadoo.fr>
References: <352592c2-e1a4-4d42-b1d2-f4b87ede2974@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_043404_560551_72C89E6F 
X-CRM114-Status: UNSURE (   0.98  )
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

Please note that this file "#include <linux/bits.h>" is already included in the pruss.h file and we are including the pruss.h file.

