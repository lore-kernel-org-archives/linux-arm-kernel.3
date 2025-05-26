Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BCFC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/ZZTG2q7hLM3GZrcupIxllRxvC3z0wIhPiqMbFVFDg=; b=vZWYKrFNUZ3QefJypiPlyhNksH
	8AnUYr6lq/REGbMfiZMoGcB9sWaaamt88dcuTisHNJdPtLyo5YPgpe1A6rMmKgCIaGaP1dqA/qOEP
	VazWC8jB4LnVZLhnbHRsARk6S3BbpXZCEqf5GavReJEd0y+d+Vm1aeVpwZQfNxVFyswKRVQK3cmHD
	Y8Eb0JKJL71cHMlVXnAvxkqzpYoTcwbuGcSui5SNN+vAWNHRvocfpct9IsN0Ov2nl0xSbUM86m4ZZ
	N6aBJXuYh4uAWNeENO2ypPmtP/Y9+tjZlqEctIRnqCVsMBaMo/s8XYz0Vb4BSXd5GUwkXGcqklesV
	iijT6CKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUGr-00000008X1M-0Iqk;
	Mon, 26 May 2025 09:37:25 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUBR-00000008WD7-2V5e;
	Mon, 26 May 2025 09:31:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 406AD433B6;
	Mon, 26 May 2025 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748251906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/ZZTG2q7hLM3GZrcupIxllRxvC3z0wIhPiqMbFVFDg=;
	b=aPapo4hOvLjoEd66BIkA1dN4XiHOGFqdSVXpM3loHuOVl3pSD0unXcrWWA3fVyjd/4bUYi
	Lop5M09S/nBAzIH7xe+RPoFfpRXaInKFiPKzvhd0bawG3B+uoMMxZ0d9TqT73I5LTtnD2u
	9ziR6MYLBMB59L83vuLT3V11TJqiZCt8d6gk38yJlwz0l/TV/yFrNBTdqQyznw7fRuClVY
	F1Y5nmyQp78/YVeEwhhWIilpyJD7IoeoIMFH5kmq+mbOHuVe8XNgePIv7xz03qy/hRK/vx
	NWG43ivHn85uB3NbW3MrdP/zX/wg6ujySE0ttHMWcTFRTbgvKHHnpohQlefNyA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, wens@csie.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, 
 Wentao Liang <vulab@iscas.ac.cn>
Cc: ruanjinjie@huawei.com, u.kleine-koenig@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 stable@vger.kernel.org
In-Reply-To: <20250526034344.517-1-vulab@iscas.ac.cn>
References: <20250526034344.517-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: sunxi: Add randomizer configuration in
 sunxi_nfc_hw_ecc_write_chunk
Message-Id: <174825190312.1028286.17391612651322284901.b4-ty@bootlin.com>
Date: Mon, 26 May 2025 11:31:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeduieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepvhhulhgrsgesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrght
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_023149_762472_326ED368 
X-CRM114-Status: UNSURE (   7.67  )
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

On Mon, 26 May 2025 11:43:44 +0800, Wentao Liang wrote:
> The function sunxi_nfc_hw_ecc_write_chunk() calls the
> sunxi_nfc_hw_ecc_write_chunk(), but does not call the configuration
> function sunxi_nfc_randomizer_config(). Consequently, the randomization
> might not conduct correctly, which will affect the lifespan of NAND flash.
> A proper implementation can be found in sunxi_nfc_hw_ecc_write_page_dma().
> 
> Add the sunxi_nfc_randomizer_config() to config randomizer.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: sunxi: Add randomizer configuration in sunxi_nfc_hw_ecc_write_chunk
      (no commit info)

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


