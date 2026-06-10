Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B39CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElWXtw4sLBNaVarioqfgV8kwo9/40KY/hAjygkVrj9A=; b=Mu/ONA1jDp+g8lCRkehjFsB9px
	CFVY/kbmMY8hZF25bnIoi3Bjmppcv/9DdbdMYJ/CA1l25riA7iWFd8PSjYS44EdsAUC35f7PMBa4y
	lyzpcqkWljhXfXY6GgIAS+kycrYwxg329vRxc4ruOwqfv8k0AZ8Ho4auNEscZTIqMILfzZW79GsjI
	rSPIO3DyZ/eRFauGIQgnGVDw2S5SNQdqz5x3zWnLTJhVV9BroZz0aY1S/7xF1pzgNWkS4aqCUHd7O
	LtRSwQuLDBMdno5w1t1qJBh7RvmXPDLRBco3kKOFPjN1Zko8CpOGGv/Nu0PzfLB/L5dgjYaImtyul
	Ucnxd2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHCj-00000007Y8m-0BS5;
	Wed, 10 Jun 2026 11:34:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHCh-00000007Y8M-0dGm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:34:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FA1225E3;
	Wed, 10 Jun 2026 04:34:33 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DE353FD88;
	Wed, 10 Jun 2026 04:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781091278; bh=40c2YVnWm1F+cAxSwyKNuTTq6vJFSXb55IXlrE1pdAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KtTEi6m+08ddxbKLii1Ua3yPwS9YUpWZA4ZClyLyzCSmSc2lKpoHXuJbRdFupRRk6
	 gHP9Ib3MxB3GJf5NYFeMsiNOlWRr7I6b9xl2BcV/COMJO+4CMJUxzQUGs6gwRf6GW7
	 4YxXoWE+VXsCZ9ndGWlSI/vmAXZXSN5yzyLeElgM=
Date: Wed, 10 Jun 2026 12:34:35 +0100
From: Leo Yan <leo.yan@arm.com>
To: Gary Yang <gary.yang@cixtech.com>
Cc: Yunseong Kim <yunseong.kim@est.tech>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Hans Zhang <hans.zhang@cixtech.com>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Jerry Zhu <jerry.zhu@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Yunseong Kim <ysk@kzalloc.com>,
	Yunseong Kim <yunseong.kim@ericsson.com>
Subject: Re: [Question] Enabling CoreSight TRBE in firmware on CIX Orion O6
Message-ID: <20260610113435.GV101133@e132581.arm.com>
References: <5d1bdf6d-ed77-4de9-b788-cf04a98d054d@est.tech>
 <aikVYZDMYuPscIKR@gary-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aikVYZDMYuPscIKR@gary-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_043439_228512_60037815 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed, Jun 10, 2026 at 03:42:25PM +0800, Gary Yang wrote:

[...]

> >   (2) Or expose the full CoreSight topology in ACPI:
> >      - Add ARMHC97C (TMC-ETR) device with MMIO base address
> >      - Add ARMHC502 (funnel) devices if applicable
> >      - Reference: ARM DEN0067 (CoreSight Architecture ACPI bindings)

The CPUs on O6 support ETE + TRBE, you don't need to use ETR or funnel
modules.

> The firmware (TF-A) for the Radxa O6 is provided and maintained by Radxa. We 
> will forward your request to the Radxa firmware team and ask them to evaluate 
> enabling TRBE access from non-secure EL1/EL2 (i.e. setting MDCR_EL3.NSTBE = 1 
> in TF-A), as you suggested.

The issue is caused by ACPI: the APIC table does not contain a TRBE
interrupt, and the SSDT is missing ETE nodes (ETE node should be
present for each CPU):

  Device (CPU0)
  {
    ...

    Device ( ETE0 ) {
        Name (_UID, Zero)
        Name (_HID , "ARMHC500")
    }
  }

Thanks,
Leo

