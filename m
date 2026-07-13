Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCD7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIMzUuxHxFqL8tOXSXuVtk8D0W+fd0ZANh/QBRHFHHI=; b=BnDakmWg22fdl0k+YanNmOCjCr
	c92n2wWtVGuUAe2O9PMRSKzBlmogoyu/PgwueAKc2os2uPwCoP/2B1muY8sWIhE2E+tD3iaBsUkkk
	3oqMBUBu+fJRWORlTrr/+PIBVJ3v+259zniSrL9SHVdl/Yz7oZPAqnyie8R/6/93TQ+xH7+lC9k8S
	ZKRNY0nG55JMBDberMdblcQWnBH+Re6GqO0HW+p6ZY2lSqIw0dfM2kbfuh+Qi2TXvZDkYeX+vXeVw
	uO1PfLT4jnXIc7FhExqCEiolZCKzj3sLzzLCZW8LTtqfQDb5S8J0voN725NNAAJ4o62L/xvzLZZxL
	3k3L+XWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCeO-00000008fas-2XE1;
	Mon, 13 Jul 2026 09:08:33 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCeL-00000008fa1-0RTw;
	Mon, 13 Jul 2026 09:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vIMzUuxHxFqL8tOXSXuVtk8D0W+fd0ZANh/QBRHFHHI=; b=v/8ZV28mhk4Znb0EaOx+s2TQ1P
	7uFqyX3EdHVxCGK1z1oFiZjknx/V4nVGCDWxKAtqnqU2gIceJQ69YmnZP8NKErapRfQTeRP++IgVk
	7P+o6z+lYns7OYc2/fHcj7zeq7SGVsfBCqQ3A0twGLNbNMtcoV+Rux9t+Z94lOSB/DkXFSdH9yBIz
	L7t7mJcwNPx065+Vf5TWTWSiq7kvMs3C0nqF1kxB5mAjqDq+OhcgSkirWSF6eBR52gmRMDWw60zit
	82Oz2yrTj0K8QgCJBhNsvBWNywoCcjEJ4af9Borx51vVn69SafKApITNI0IP5cs1jD9Lmqqxcm49j
	TzXFyhTw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wjCe4-001OGg-2n;
	Mon, 13 Jul 2026 09:08:13 +0000
Date: Mon, 13 Jul 2026 02:08:08 -0700
From: Breno Leitao <leitao@debian.org>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-acpi@vger.kernel.org, dyoung@redhat.com, tony.luck@intel.com, 
	xueshuai@linux.alibaba.com, vgoyal@redhat.com, zhiquan1.li@intel.com, olja@meta.com, 
	kernel-team@meta.com
Subject: Re: [PATCH v2 1/2] vmcoreinfo: expose hardware error recovery
 statistics via sysfs
Message-ID: <alSqd2U9zhqYz1Wn@gmail.com>
References: <20260202-vmcoreinfo_sysfs-v2-0-8f3b5308b894@debian.org>
 <20260202-vmcoreinfo_sysfs-v2-1-8f3b5308b894@debian.org>
 <aYvi4Y_HNqk_u1-v@fedora>
 <ak0JSScR3EYgLEf9@gmail.com>
 <alDRawveM-auCHwB@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alDRawveM-auCHwB@MiWiFi-R3L-srv>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_020829_140501_5D4455F9 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri, Jul 10, 2026 at 07:03:07PM +0800, Baoquan He wrote:

> Anyway, I am glad to see it's been taken out of vmcoreinfo.c,
> which is going in the right way from kdump side. For its migrating
> into driver folder, leave it to the relevant reviewer to review and
> decide.

On that patch, If you could confirm that moving it away from vmcoreinfo
is the preferred approach, that would help establish consensus around
the right direction.

Thanks,
--breno


