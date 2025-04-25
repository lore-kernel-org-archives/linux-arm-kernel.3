Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467C6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVmXxPc0GsxJCoufkyTtR1wIh6N17gyPoDGVcYXM0fk=; b=x8SSfW0Hor61kkXDY7v25++PbH
	8XJ9O0dOyf7w03kaFUALx11mt+NTQEFO9vvKbYpeAdVRi7w6gsKINbQtFCixvZu0QeL6NGZGdxLx+
	INlJ9y5RfWQaZmCtg7y8GZaU6TIndkcqTGZhKrnWpYEF/YAoJJ7Zs6tMiVs4AtA0Ld8r7WE9bnoxN
	HyIqgamQmzZwcqlTvnnaagxz8jKuSH45g0CxPr99z7XIkl4EhnL+3sKgIIHpflVNNFqLrnE37MMTC
	GNXARGw+MTAM8mEtTjZ6Fn10fCgow7AxX395VitjVR0qJfvdrHobRlkBT7QnHKPZwAHP0MEDnro9B
	INX0INug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89KO-0000000FpZa-38fd;
	Fri, 25 Apr 2025 03:02:12 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89IX-0000000FpTe-2Tsu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:00:19 +0000
Received: from localhost.localdomain (unknown [119.122.214.249])
	by smtp.qiye.163.com (Hmail) with ESMTP id 131194130;
	Fri, 25 Apr 2025 11:00:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: amadeus@jmu.edu.cn,
	andre.przywara@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for Radxa Cubie A5E
Date: Fri, 25 Apr 2025 11:00:06 +0800
Message-Id: <20250425030006.45169-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425023527-GYA50272@gentoo>
References: <20250425023527-GYA50272@gentoo>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkNJVk1OSEpPHktPTB5IGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VJT0JZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a966ae36a7503a2kunm131194130
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRw6FAw*GTIBSj83AzhNIlEK
	FBIaCypVSlVKTE9OTk5LS0pJSklPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUlPQllXWQgBWUFKS0NLNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_200017_810894_8A453B90 
X-CRM114-Status: UNSURE (   6.95  )
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

> It seems I'm a little bit late for this, but while we are here,
> Can we also append 'cubie' to dts file name?
> e.g. - sun55i-a527-radxa-cubie-a5e.dts

Usually we use the device name (without the vendor name),
maybe sun55i-a527-cubie-a5e.dts would be better?

Thanks,
Chukun

--
2.25.1


