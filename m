Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89064CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zi3AWAsWdvM22GjvQIVPQFc6Mxss+rvbYqBw7UzGyeE=; b=ACP7Ff0beofEx9lQZX0zYscjtg
	o3c/zuI+4oVxDfldS71GhyP3yOPNpdeGXmWX/HFZgwKfi6YVbV7d1Znl5Yz/SadH/ZY3ZIOnQ87RD
	xvz33GQ0vk94E5WgQM60Up2nss2CgYylKLTKQ7UakeP3gARqHDnKwbzc1HWuchYOmBSDJKKNQlr3u
	IWYyLGtENgXEvHQwyN7t/ZxKlvEVH2AucQk91GSBC23r05pu17ma+iTVcbYjQDSGOSKJ0iRxoVj2H
	k88L+t3f/qsEJno9mS6Sdc33eZI0Y765PqUK0WeNRv97eUXKqrTKsmSasGQChuyuAjq5ebx1KeJcK
	0oq7H2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOKB-00000002Bij-2Ems;
	Tue, 29 Sep 2026 03:16:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOK9-00000002BiL-2EK8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02D12601DB;
	Tue, 29 Sep 2026 03:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2371F000FF;
	Tue, 29 Sep 2026 03:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651768;
	bh=Zi3AWAsWdvM22GjvQIVPQFc6Mxss+rvbYqBw7UzGyeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bhRDrf4Al/KtmagUUzQAZ9RFwOOAQMhc9aJe9mNq2QsB7TezKa4K0KyE4N+bk/0Jg
	 4zOAPoMzmsXv+PP7hWcHS953mO1xKuhXxeB4yOmvxhJa2yeFfuBcVAsi782Iiau22V
	 hzY5ufLAndBul031v9zQC30xFbEI/8TU4IUIeK9KKoQRQ7T86RHVIJjUvXZuy8TdL/
	 YKKyiI4q00o5y3DI2E3/u2QSowUSpVhD331Ee0IqaaScn2UwwBRd6QRGpr0rymC2BB
	 NjlqVKCEwOG38eHPrx8gwVx60vsZlzvMaYHAvPsZxOC8g6QAo5P3PqWPDmEjECs/xK
	 jcYRg2GnwMOqg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable EMC2305 and PCA963x drivers
Date: Mon, 28 Sep 2026 22:15:02 -0500
Message-ID: <179065170895.2673486.235864561326858076.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
References: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 25 Sep 2026 09:51:55 +0200, Loic Poulain wrote:
> Enable drivers for the EMC2305 fan controller and PCA963x LED
> controller present on the Arduino Ventuno Q board.

Applied, thanks!

[1/1] arm64: defconfig: Enable EMC2305 and PCA963x drivers
      commit: 8b8d8aa9d482b08d5315e4d26631b9891c90e02e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

