Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5D7C5AD58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 19:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5HjiWG5cz9UpFjoGigb7CyZFQukFWNkONY43+FvEaw=; b=rC6F72zmm9Zyx5uRx04giN6xY9
	t1u29vcZx608LlSeY1zdEWnLeoy5h1rVsMCG0XmqMnkzyDCKP3QEka39kq/nIl5jKJ3+KZsCHxk2j
	TXOjs+Uzt111TkXmMvt4pFU7iLpapmqrzrJQsLliJtGSJPSdFa7CdB1EzU9XY9V4GV9OcJ8iaTfDy
	5BlBqR2rftaH+GqPEg8pDGG2wkq53QNaM4exDgLhhp1JbnbDd179k/mOnsOcA8VTPMzFCmxIUsi2f
	pnHqKxjDXn3E7+6sdIYeh4RPPoNuXsc3EBZdxJ1h3N/jU5dXL1VBcw/fSEujYC+fl2dL28uZjjnFy
	LtOnMvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVss-0000000FUSu-2pfM;
	Fri, 20 Feb 2026 19:09:50 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVsp-0000000FUQz-22Oc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 19:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=S5HjiWG5cz9UpFjoGigb7CyZFQukFWNkONY43+FvEaw=; b=BbGAeXhvvDj1DfPtGRObKME4yA
	//ZMGb2KoNsg8i3XGXNBtWVhqSFiPdFyUH9NyPT0O+lGdgQqUNODdtG+Vsgvw3vbR2jZpf9tWjpzg
	sKgbSBNAC/0MRPiCfhXOtbz9sa+f/LJpCQtW+TjYFcqvfY9t4kKtRfUAsLNpRz7VJ6P4urA1bh95D
	xCQLu/0zvVwMWiUa7TXDCdSKY2AvP+69qv2BsOpUHC8gqPos8/lLx69LO0aqcaJfAeIRuquzfrIry
	ub3sGqScap55ekn6Y0oeaGd41tFKk8D7XZpNVBnJR3fsg2TwoocaFOIFy0oHhxDi9EBQdA5qUcn3C
	y6ME9qWw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vtVsT-000NQc-23;
	Fri, 20 Feb 2026 20:09:25 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vtVsS-0000HK-2r;
	Fri, 20 Feb 2026 20:09:25 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 19:09:13 +0000
Message-Id: <DGK0Y27COUI1.34WLTZKYFC99V@folker-schwesinger.de>
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260220132845.7118-1-rahulnavale04@gmail.com>
In-Reply-To: <20260220132845.7118-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27918/Fri Feb 20 08:24:36 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_110947_817104_2841BA54 
X-CRM114-Status: UNSURE (   5.54  )
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

Hi Rahul,

On Fri Feb 20, 2026 at 2:28 PM CET, Rahul Navale wrote:
> From: Rahul Navale <rahul.navale@ifm.com>
>
> Our setup uses a custom FPGA design with a custom XSA file for the PL.
> The multimedia drivers (audio/video) are also customized for our platform=
.
>

this is an important bit of information. Could you verify that your
customized driver uses dmaengine's dma_get_slave_caps() to obtain
channel capabilities and that the newly introduced
xilinx_dma_device_caps() is actually called?

