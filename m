Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9177ECA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 21:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNeWzW9I/ABPCzTG0dJOSZCPRxZNNQzA1NjIlJqZwl0=; b=JWerneLarkSEiG6iqMF1q3oGUk
	RzaWQiyoTSQ5Eslzwi0sNklqeoYfSrxTU58xBxadwXIx6tCh5osfAFqukxFuAqiwHcSrh8GkFHVlv
	H5PeCaxpTEkjXE6cNZ7s6AdgVqnUEVLLEhfiiXLm0K5dw5q1fBvjyZUUj4MLslkRFtoW0C3Ef6m7E
	s5WoEMDb8ZP0liY3kLp6k/JnKyWf2w4DKl5ROrnkagiDsz8Bw0s+Bg2As2BEzd94efuTM/k8UHUKN
	/HYkOeMQJlrKOipGqJZa2sXSx7e4S+aHCx8XPV67jGk8w2KE3NjhTwH7qkez8Ea/V/xFQW2G43fvt
	tGeqDNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqetH-00000009mzu-2Jue;
	Mon, 25 Aug 2025 21:38:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdnF-00000009aNw-32Zi;
	Mon, 25 Aug 2025 20:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nNeWzW9I/ABPCzTG0dJOSZCPRxZNNQzA1NjIlJqZwl0=; b=aUM0RH95yi9+j1C0ORkCABiVAT
	r+P7z12WB7V8YYajC0N3XgW9d/QLcPTaDVFGnkQXHYEwChgBX8w8jyLAA8xAS6zt7lY6e+KtKahwL
	Q+Oqu1SJvIHN/6b3CotAMi1Ih43SuvTA+kPhK1xvT4978oaGo/H0WEo8Pvoau5ue/ik1GLVrJvSYu
	oOWEh8T9B09vJIEzF1e6ScB1PAkDLA6dvqwzle3khgiLOJp0nLWKwo/FPUjcGEBMJo/qdpq8ZnBls
	S8HaVApUA8ETa2+FL27Nw0WyQIbglh4vyPhwUmWLzpRXDVMK7X+Zfe+7GdnhC7skoV8L/SSDsOmbN
	BZcmGq5Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdmz-000000022Ux-3Lhz;
	Mon, 25 Aug 2025 20:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C45A25C5D3E;
	Mon, 25 Aug 2025 20:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA69C4CEED;
	Mon, 25 Aug 2025 20:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756153652;
	bh=79WC5dniFXbsSV30eLKdxW1HtvAVSX4i8o1Sshwh+LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0IvxfsTDyL/QO2TYSIAAXgsfsI8ikHK5xXsZ2cnrc8DMYMtCVEutngYoRIbHMHVBV
	 jgnfSNho5tfNGAku+NpB/IW7PefuGo2d13j09guDXnlteJ2PjSq5gXUURSO+g8oYIS
	 K709FssXA0h5+Bhiw5OWyBCbrjVoTdZJNYOsjD4U=
Date: Mon, 25 Aug 2025 22:27:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: xion.wang@mediatek.com
Cc: Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, huadian.liu@mediatek.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/1] misc: Prevent double registration and deregistration
 of miscdevice
Message-ID: <2025082545-extrovert-photo-3358@gregkh>
References: <20250825084556.10358-1-xion.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825084556.10358-1-xion.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_212739_157998_0AAC4159 
X-CRM114-Status: GOOD (  15.16  )
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

On Mon, Aug 25, 2025 at 04:45:46PM +0800, xion.wang@mediatek.com wrote:
> From: Xion Wang <xion.wang@mediatek.com>
> 
> Dear maintainers,
> 
> I am submitting a patch to improve the robustness of the misc device subsystem in the Linux kernel.
> 
> In the current implementation, repeated calls to misc_register() or misc_deregister() on the same miscdevice instance may result in corruption of the misc_list or kernel crash due to multiple INIT_LIST_HEAD or list_del operations on the same list node.

Don't do that then :)

Seriously, what in-tree driver does that?

> This patch introduces additional checks in both misc_register() and misc_deregister() to prevent double registration and double deregistration. By using misc->this_device as a status flag, the driver can safely determine whether the device has already been registered or deregistered, and avoid performing dangerous operations on the misc_list.
> 
> With these changes, the misc device subsystem becomes more stable and reliable, reducing the risks of list corruption and improving overall system safety.

But again, what driver is doing this?  Why is this really needed?

thanks,

greg k-h

