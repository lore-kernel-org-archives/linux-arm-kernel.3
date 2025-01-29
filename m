Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E8EC02190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjfdSmbQZktN5AnxF530CGf5ncUa+GaO91f0NTTVYT8=; b=mCiBS3We1fyFH/3v1LKOf38WJM
	0n3us5sS/roXYTEEirY7XkFg1JgQ6Rj0TFd7b1yCWGncHtaZpYzpUactZeOdJNX/V8JtqRS+0CURY
	smJBBKI2e+S2qg4PVxcOJg61vYvmvbLJ1Lw4NUA8oX0OT9bgbs8EFM8UPSmhceUnzD2JGt3jON40g
	lzu+5E9D4gTIUsCZl6IJn5QXjqX4yAFr1kLVrzJhtlnG4BWEio92eWDIL6yx8fy7RUW2Wu7FHOiMe
	CRbrhVWpheCTYtsXOlbxsHMg6nobi+5ZtziVg5GByQbjHMrzDPbpF2WdR9VN6IkZO8xwhg5Q9rRaU
	pOBfi1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdATd-00000007KV7-3DTH;
	Wed, 29 Jan 2025 15:59:41 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdASJ-00000007KLG-2cRa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 15:58:20 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B9E3E403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738166294; bh=tjfdSmbQZktN5AnxF530CGf5ncUa+GaO91f0NTTVYT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EUvyeNefOLOVUnMaofBK1H3VrSTLnaSlL87jx7p1D8vCpTe//kPARa/vTp8vnI9eh
	 ZcG53tpMFiswUuYASOHls3F6Vg5XW9ch6xNSsazTupEasEYPFW2nOxt8Ri1SOg0qfC
	 cSwBXy7FWpxJvTRK+yKEISaHvGCbkKNyRXvpdUVR/Rpkf6uDT7Io/vRbNDEnkIiO4D
	 PV60yuvuSfVyxJctDKDNc+e/lbPZncho4w6bcVdj29uUH8jLc9KZnRB9LTDvIw7oe2
	 mxBi4mFGEzdiqrwARkBYV5Gts0IDzSHT0Em/bRXG67PywB1R9Lrhr6sg6omcQPSl2O
	 ryOWxxYoG1cWw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B9E3E403FA;
	Wed, 29 Jan 2025 15:58:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [RFC v2 00/38] Improve ABI documentation generation
In-Reply-To: <20250129164157.3c7c072d@foz.lan>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <87h65i7e87.fsf@trenco.lwn.net> <20250129164157.3c7c072d@foz.lan>
Date: Wed, 29 Jan 2025 08:58:13 -0700
Message-ID: <87a5b96296.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_075819_667233_B746A197 
X-CRM114-Status: UNSURE (   8.86  )
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

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> So, I'm proposing to change the minimal requirements to:
> 	- Sphinx 3.4.3;
> 	- Python 3.9
>
> By setting Sphinx minimal version to 3.4.3, we can get rid of all
> Sphinx backward-compatible code.

That's certainly a nice thought.

With regard to Python ... are all reasonable distributions at 3.9 at
least?  CentOS 9 seems to be there, and Debian beyond it.  So probably
that is a reasonable floor to set?

jon

