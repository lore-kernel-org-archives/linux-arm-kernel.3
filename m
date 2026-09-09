Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6745C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8mVmcBNQRcUr40TX7TzG10oD0qawFvTxK/+rQfqGH8=; b=Ycs9hBMAqBmIe0Q4Ru3a378w0D
	hw7SeMvkPuV7gWizReRtTfNyNvMOCf/Ii7rGC7tNbQ7nePS6djT7XnQNA8VR9dcTBfsGAORFLJ5t/
	2nLUDzkooxCQC7db3khc2oaRmCuGnfGZL46xzOahL4bdFsYUlqVbicFoTbUZKTpc4ir0Py+5h8ZXm
	44lVlUugnzidofj1PJePZ5aVWkSRJN5VyMcUv2KoeysXskJOLE+BK4V3k8Z4Hgq9QXVua2n+22jE4
	s8+i6nQSFQsBzLqWJS3gR4r5M9sG/AwugypEQ0n/LmWV0/zGgvqmSuvz//t12TVWeW9OhGMeBZh0w
	6jy8rBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ke0-0000000CF3i-0NP4;
	Wed, 09 Sep 2026 15:55:28 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Kdw-0000000CF1o-3nKq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:55:27 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hg5486rjsz8sYW;
	Wed, 09 Sep 2026 17:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788969321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8mVmcBNQRcUr40TX7TzG10oD0qawFvTxK/+rQfqGH8=;
	b=CxMBx3uU88mh1ll/lrVnYH6E2Dm76+ffOEjVvbdkiTgWwz3as3NLSdUXq86qrEkeNpIN/O
	GFSXoFx00A/nYV0jahOvb0I5Ei+S5+4xn29QE/gxbOPSYHKR6h92WGdXYfmyfIwKdmz+3b
	OZdUTL+Z15+U2zlyyn2fAgbtAd52A1+jVdp1btyMjzSOD5FKiUoUp/ZhP+D9++dfjnJVkq
	Rw/IIiRow5lW8oNGOKu5+mdHPhoOB3QFawstgJ3bL5OmX2r4T6xCDlwLR5m1q4mdIB5IIN
	m1yxI+GkK8+IttHNDWTHlfXtXoCagNr94iGZUzBSYsObEvvax8tDbLbv9pY2hg==
Message-ID: <34f4c088-5268-4add-aef4-33b3d3623c12@mailbox.org>
Date: Wed, 9 Sep 2026 17:55:17 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8ccexz6nocmeqr7i14osdxorp8fge9aq
X-MBO-RS-ID: ddaa8513b879ba6e098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_085525_090030_6A30FAA1 
X-CRM114-Status: UNSURE (   8.30  )
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

On 9/9/26 5:31 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +       /*
>> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
>> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
>> +        */
>> +       spi {   /* SPI_1 */
> 
> As this lives at the root node, I'd rather change it back to
> spi-ws-2ch-canfd while applying, if you don't mind?
Please make sure the DT schema check does not complain about it, 
otherwise it is fine, thank you.

-- 
Best regards,
Marek Vasut

