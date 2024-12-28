Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03003E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HA7FtOt4rXejNFshL0fXp7q1bshzAQm+zGIl90qyzM=; b=EqH2ed/Sbaya5WD2+a9KsGglaj
	+UaquluPoixj6qRXmVqjhvNOiugq0K5u4iRsmzliFqI2sEj4fsZ9zpYSKASiTvRQnZHzoekDnlqip
	FwJsH/fVTJxQqL9hStK5Bx5MvwxVLsDHu3YuHi0iYiKYiY6uKOLowG4RBOnl87365bor7QSwiCou8
	pIpN5H4YEuGbiBVI33dj7iiUBIyp4/4V+Mj5vIqA1vvh/bRSyAHf+wsp+KwYvuMmyAewlar2FIW4p
	+m12CzPbRqU5YVo52Gaw3kb05ov/kEy7XJMWU+UzQvYxGrYqBTSx2pUK24IXsX++q4xmbrUqAW/rG
	lOi7osVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRYSi-000000023kG-1jFN;
	Sat, 28 Dec 2024 15:10:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRYRW-000000023f4-2qfH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 15:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E99875C54A6;
	Sat, 28 Dec 2024 15:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E035C4CECD;
	Sat, 28 Dec 2024 15:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735398569;
	bh=YGFktZ9edCTGmBVJdWffFblUSWddkTUls5OAQ/cXnmU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GnP+MoHEGM5RF0MFXsjpHDZ4XVt8+xWSs7h0uUeRADOY89nqolT5U6ruTbu5BxeLX
	 g+A4R++YhRI2hjtNboh03a/o2k5kYt5S+YwNxsRY3Pj6GSgzAgjmuyAxJoTj/gDtCR
	 8Egqj0ofpVYroaqOhDVd8jTTzgsqplVDg/7xmNYwLfd7/dECOWky5jLYZbvy307ZW+
	 mpxjdM3rQ1KgB7mRQu9Z7QsUIcwPA2uOK2abZQbIKyUF0+rzSfy4hfcb0rU+rNexNl
	 PURi/nr9Y6nHDk1K1u7sG6OeYO3Z8eIL3Xz4chn4pMbbn1eMQjtDiZ5COtsqIVPkRz
	 monVx2SiLB/Og==
Message-ID: <76a93a4c-1dc0-4ce8-b851-924b0d0d963d@kernel.org>
Date: Sat, 28 Dec 2024 17:09:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-main: enable USB0
 for DFU boot
To: Siddharth Vadapalli <s-vadapalli@ti.com>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com
References: <20241220054550.153360-1-s-vadapalli@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241220054550.153360-1-s-vadapalli@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_070930_772091_E2FACF11 
X-CRM114-Status: UNSURE (   6.17  )
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



On 20/12/2024 07:45, Siddharth Vadapalli wrote:
> Add the "bootph-all" property to the "usb0" device-tree node. This is
> required for the USB0 instance of USB to be functional at all stages of
> USB DFU boot.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


