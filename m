Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3EACCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkjOKeAb49sis7EWwyWb6dVtEtQGuocPuWXQlDktOeQ=; b=QzQLDuZwrn7/E8uD4206O1RxOy
	dD8n+C0PpmShwnJSYueUkHEEvLMsgrbJeiWJdB2Jqhd60M2kbkUDNqAvXr8ICXoXV0O8C5YUF2WUt
	g9hZGH6G9B/WePEmmllZg6LkxXZORqu79iAsjjHWkMcPQ/D86GTYhBXQ6ppJR2kO2x7N3psR/yotv
	Cut7gGk4IuDE+8RposY3YTpOJpp/HGyx4FLXPd34hRekcQgFozBWYqUebZ7kY5Jztm2HghzdfTcAN
	1+jzmCwXXcw4TLbdjZUmuHKEWtXpG3HWo04a0Giqg1WihWvOC8yKhVJmVRba5wmCDwfEtN9e5t3h4
	Hd8Wfblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBszE-00000005ze0-41bb;
	Thu, 23 Oct 2025 10:56:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBszB-00000005zcz-3Q5g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 10:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LkjOKeAb49sis7EWwyWb6dVtEtQGuocPuWXQlDktOeQ=; b=yX8OD/im5FX8eC/QjhMrbbUjFn
	PeNDZhCP4RIpJg2TVmknhZO4G/ZGcASouffR782DL2Rd/GWyV7g6MQF+fcoMbnSCkPJGeOr8gm5KU
	H80jT0YsD1Bnj0IeXfXRKEx+x/jdEtelXZX48HLQLcwdxEbXa7nxdMKn/PQcS3W3eYlnGBbmFjfek
	tAscqFiPtLNIUGaY8vkj9x0b2RnwlWNrdsL2/TjV9QWH7ha+VrUIV06N5h1PgGBns34H5QfbycFdf
	l+LKaYWmhDo/ztWYWKgYWrJO0FpdDmEFvLOctBdMhKMaNZ/p2CUgJ05ob+tbX/vmTFKz+x8BGHyIL
	tFrj05uA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47994)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBsz5-000000006DR-2v8s;
	Thu, 23 Oct 2025 11:55:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBsz3-000000001ci-2V28;
	Thu, 23 Oct 2025 11:55:53 +0100
Date: Thu, 23 Oct 2025 11:55:53 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Qiang Ma <maqianga@uniontech.com>
Cc: ardb@kernel.org, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Remove duplicate function calls and useless message
Message-ID: <aPoJuaoqjZ9L9ifl@shell.armlinux.org.uk>
References: <20251023082051.75183-1-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023082051.75183-1-maqianga@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_035601_883257_4B6C2E3B 
X-CRM114-Status: UNSURE (   9.20  )
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

On Thu, Oct 23, 2025 at 04:20:51PM +0800, Qiang Ma wrote:
> From: Qiang Ma <maqianga@uniontech.com>
> 
> This patchset removes duplicate function calls and useless debug message

This isn't a patch set. This is a cover message with no patches threaded
to it. This makes it difficult to find the patches.

Please ensure that patches are threaded to the cover message.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

