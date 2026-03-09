Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4299EA852F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 01:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPl7EyK46nq6QANiAnbrrAMZtf82iLVfI6iSq1CexTE=; b=a+0n+w+mjb/Q9LxKFQS28n41Iq
	r4VFZk/Tr4FnW/Ab24mnZILq5AegEbyMWDj31YPNAY6PXNWfZ4NqHwU3jIEkyBlOLjt/kCAsY1BMk
	+Di3At9VfxTPwrv/35SgLFT3KDKyeVes75KVdiUEK7wXKz9b89K6Ls4dVoAhGWXx7E9SPeEl6l19C
	ph/7L9KrQ5ZpQcmxkz4jBXgCcukAu7di8HxXQ9/GX8WBgqazm0u/CXLRfUZ6KCueZBm2oClR/zTpr
	RWwfERio1cwsL9aqlYgHWEd8GyN3u5cbtHuHe2ta1DXaJtI+RnVsp9KaK48IwqdytGlOcX90ukynF
	0ghb/yxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzPgk-00000006WkY-0E0R;
	Mon, 09 Mar 2026 01:45:42 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzPgh-00000006WkB-1FYT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 01:45:40 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id D533D1C959;
	Mon,  9 Mar 2026 01:45:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 0486E30;
	Mon,  9 Mar 2026 01:45:28 +0000 (UTC)
Date: Sun, 8 Mar 2026 21:45:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 00/32] Tracefs support for pKVM
Message-ID: <20260308214527.67ccdef8@robin>
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0486E30
X-Rspamd-Server: rspamout06
X-Stat-Signature: 3uonkhtsoep454zd4idfdnr1egzr6gti
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1986IueEcbF7lKfSMe3+OUW0/FjB5l0zI4=
X-HE-Tag: 1773020728-268821
X-HE-Meta: U2FsdGVkX1/fQHUtu2zwWLUleQxw8wSkEUSAwD5DuDzK6zFikmh8PU7S1Qmq0swLPt4xvk7ISiEp/nNkwyfJnGTaZL9dUWVeHQcSbjmHJTHteIpq3R6QvA/nAS37dKeMkH57C9iXBB0/ZbIWsTaNTXymNQNqMUiMsQ2rPr9J7pcU13UZf8cXmuu6u6pKZv3dO7QPR4BGNEN2lM2XfdWCL5mBCKSM4MiDzg8ECLIegCoYhWsX/G7TLF/wiCkd82R0nlB1aPOlYDyuts32APwxWlxvsnM842Dd7XjB8q5R3hbVDy2QULeYPBsq5YWG6zu5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_184539_441410_DEE6AA66 
X-CRM114-Status: UNSURE (   5.61  )
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

Hi Vincent,

Unfortunately, this doesn't apply cleanly to 7.0-rc3. Can you rebase on that?

Thanks,

-- Steve

