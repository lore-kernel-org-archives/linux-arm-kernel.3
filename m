Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989DDCD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 07:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SufUsgIiggL6e/QIsAbNMiTlzAF35c8U1qsO70/sUus=; b=ywXwVeIrd7/L/ar7UtriLeRTUI
	vWgnuVMrSUMSsvkyqe+CUyuwd2RJ4Jg3gGVgg/wtagC7zIs4Ia60Oy/+HTBxyIws4lDaToKM74xfk
	e3V5qN1JjwupKI2y9dyu5AgIbbs5e+dM0coZWNdE5KXOeP0cCd0Ue504W5Xvwdp/DFHm1kk8lyu5k
	axnp2R99Yns371Ddm1axmyjoj24rNTA+dasJt4tGhtpxwWFUogKSBZvH/iO/5zsnyHEUqCdUyFmJj
	kLu4O9SYrRsimv/XCkNMx2dkNWC0XFYJmFb0MXWjq8NL0ej8Sf+ldC3w/W8hdrIFTO8aAMI/1P8BS
	iPUjyvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPOk-00000000GMc-3Juc;
	Fri, 05 Jun 2026 07:55:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPOj-00000000GMO-3y3E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 07:55:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50E3643C23;
	Fri,  5 Jun 2026 07:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928EF1F00893;
	Fri,  5 Jun 2026 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780646121;
	bh=SufUsgIiggL6e/QIsAbNMiTlzAF35c8U1qsO70/sUus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Isn1we0gRQ0IA56VJ975zayTIgZQq5Q/UX1+bWoFxBuH8QH8uUAvYT7WJHJxt0eeh
	 UmKSH62XntqctekH4GQbNsJ0cLWeZ1uP1Frds27G+a3hAp7j7wHBtrj6sf5hk+QktT
	 HvDNRxnDTy4bc6kbfrSXAUcAX6eTh5/5RHE9eYWbWtS00fPcJ4XvyWQFdZYmkbjxz7
	 GWi4xv+XiYvkO6Ub7+rvh2BRxDZeyO2ydUWM59QsMimuaGXDMvUonpLhMF6CS3Sgzh
	 sGst1S+VgDdfXYtCAwLW+VplkI6zq2QaVk4r4ijJQq8dxm8/5jFvULNUDDy8qxPszQ
	 fcFSWBqio6j9g==
Date: Fri, 5 Jun 2026 08:55:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v01] mailbox/pcc.c:  add query channel function
Message-ID: <20260605-undetectable-polecat-of-wonder-f817c0@sudeepholla>
References: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
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

On Thu, Jun 04, 2026 at 04:37:48PM -0400, Adam Young wrote:
> Drivers need information about a channel prior to creating a channel
> or they risk triggering message delivery on the remote side of a
> connection.
> 
> One of those pieces of infomration is the type of channel.
> 
> Add PCC channel type to records and expose PCC channel type to client.
> 

Please point me to the user of this interface.

-- 
Regards,
Sudeep

