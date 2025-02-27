Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53BDC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guEftXoNJKwkM6MgjwblUug0shsafyPZ98TWKbr7I9Q=; b=CuIGja0YO3EdoOWIpS+psYs9Gy
	Dwqvv6aG37Qv7oUGLfrqXkltM6J8M+ZuQcuIj7yPpFp9Ge+Oq8mNnc6/gpOJQos6Gt7M1AwmB2vOU
	iRDbrF+ycOlKMwewV8j0SRJOofikClFz7yvXclbQKjiW64nYv2wtvdzjh3c57O1SWZJnkb0UEGyut
	LvfUFfiZGfsPi1DRyOebzm/fVcejhZo1DMbpzcxxxbA/nq2X2LmSOSRpSMHQCa6TAk7dwXDmHrzzd
	e+Kghxcb3siFqrTBIJivFnX2ILOzSWRE78nvAZ7QSmZCyjawkWTQP/FSqrGCdTqZdjbGOwkFnqyja
	QUFfLmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfFh-00000007pKO-0hZr;
	Thu, 27 Feb 2025 14:52:41 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneu2-00000007jwE-46Ha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:30:20 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A5C4DA0D06;
	Thu, 27 Feb 2025 15:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=guEftXoNJKwkM6Mgjwbl
	Uug0shsafyPZ98TWKbr7I9Q=; b=S8PpehatVRCtCf2eASlnS5FG74i8rgudDSzZ
	nz3fu+p7mkqrT6tV8O/LT108g8j9betYkx/Vct15GKoMnyYaxv6S6z1DZneRJRXh
	rJ+6ENF1WVLRwtN/Kk+pIWAazdVDr4cnR1u7PZ3mdtsSoot81dDzLkVh+m46vFhL
	X13dQaUTqqbjLtA29XDI/0w26IsQFta8o1B3TnIUk9q7/Vbkx3bTmb8Y6enAYsGe
	ItQ3AGz4cyUsh5GUYiMufs/Ftdp6JVZYYcCaZ/tebRZzx1c9ALb5DbE6C1xA9e5c
	nehWTKefs0drnbq93Pf3fax331pKQFAP4MS14UmtwplREBKSspKA9MaVTWYglo7B
	dbbOqePnO8awc3KzrwHKSAUKUGvJNj60CG4oR0m6bjMw7Cs82aoQGDEZ1kd0erU5
	HTaibORh+a9ANaEvN57dmu2qaDT3gKAOTcUXca3YFTT6EkmqsXZsN/liX4czvAn9
	d43y7evKZiARubXamnrbn649flDFYMVmrYnfXuN0egYSrw0WUt1rHCmgTuuYA4Ap
	qXZiXF2r2MhdYy7qBIxhPV4VUcAWSGVYCQD9PjvAUOPI2xbILfxBlGdz6I5/YyMw
	ys2b/LmeDkEOCWC98zXcgg8UEAJIOlZHvr/4M3kawN7+F1Z6HlACxhPxG/v3Yvps
	G99VtWQ=
Message-ID: <d1468825-aa4f-4f0b-aade-04bf61aa7c40@prolan.hu>
Date: Thu, 27 Feb 2025 15:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] counter: microchip-tcb-capture: Add capture
 extensions for registers RA-RC
To: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>
References: <20250227142751.61496-1-csokas.bence@prolan.hu>
 <20250227142751.61496-4-csokas.bence@prolan.hu>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250227142751.61496-4-csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_063019_167414_93296891 
X-CRM114-Status: UNSURE (   7.45  )
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

On 2025. 02. 27. 15:27, Bence Csókás wrote:
> TCB hardware is capable of capturing the timer value to registers RA and
> RB. On top, it is capable of triggering on compare against a third
> register, RC. Add these registers as extensions.
> 
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> ---
> 
> Notes:
>      Changes in v2:
>      * Add IRQs
>      Changes in v3:
>      * Move IRQs to previous patch
>      Changes in v4:
>      * Return the status of the regmap_*() operations
>      * Add names for the extension numbers

Uhh, I sent the wrong version of this patch... Will re-send it shortly...

Bence


