Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191FDC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOF6QBnm1Fg94nNzGAS2r+WBFBfz7qL3PHeBCr6ULOw=; b=is+ON61K9YMwZ8ZGeQ6h5JuCmj
	m87zWkNfMUOj4EwhpMxyE2ALWrhXbO6hg981sPeJLJdIZ3sCTLwYIKa3lm7Xj25wU5tVtEezQ/Z+G
	t6Ml9FDxw7iuyd6kqsOHOSTMIQoGUV6jd756f7XIaSsrp3goks2dlIE2V7E8Sosq8AQcfDWJ2bDFa
	0wVNAF8TedJFO2czKEq7PDrQ2DpeFE0d0aXk1OhSKS/UYNWGwmQalPT1cyxWnGEeOOtL7Ui0aK/fH
	16x1z7vNVrbLo5GJBxmplooQrtZK8LQGp8t14fVCvsNuqbeIKZhSP3EdaXFvt4fc9YArI/U7k1WPB
	nvlyGD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0JS-00000004Uov-3JJ1;
	Mon, 17 Feb 2025 12:33:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0I0-00000004Uer-25m6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 12:31:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16C171692;
	Mon, 17 Feb 2025 04:32:12 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 198303F5A1;
	Mon, 17 Feb 2025 04:31:49 -0800 (PST)
Date: Mon, 17 Feb 2025 12:31:47 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Keita Morisaki <keyz@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
	daniel.lezcano@linaro.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, rostedt@goodmis.org,
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, aarontian@google.com,
	Sudeep Holla <sudeep.holla@arm.com>, yimingtseng@google.com,
	Dhruva Gole <d-gole@ti.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v5 RESEND] cpuidle: psci: Add trace for PSCI domain idle
Message-ID: <Z7MsM5Va5xi-Nuis@bogus>
References: <20250210055828.1875372-1-keyz@google.com>
 <CAJZ5v0hWNYB69ydM4--GNtLBgG3WS4MT+S10w46883kHnFMMEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hWNYB69ydM4--GNtLBgG3WS4MT+S10w46883kHnFMMEQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_043156_578975_E30A0B11 
X-CRM114-Status: GOOD (  14.03  )
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

On Mon, Feb 17, 2025 at 12:57:07PM +0100, Rafael J. Wysocki wrote:
> +Ulf
> 
> On Mon, Feb 10, 2025 at 6:58 AM Keita Morisaki <keyz@google.com> wrote:
> >
> > The trace event cpu_idle provides insufficient information for debugging
> > PSCI requests due to lacking access to determined PSCI domain idle
> > states. The cpu_idle usually only shows -1, 0, or 1 regardless how many
> > idle states the power domain has.
> >
> > Add new trace events namely psci_domain_idle_enter and
> > psci_domain_idle_exit to trace enter and exit events with a determined
> > idle state.
> >
> > These new trace events will help developers debug CPUidle issues on ARM
> > systems using PSCI by providing more detailed information about the
> > requested idle states.
> >
> > Signed-off-by: Keita Morisaki <keyz@google.com>
> > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > Reviewed-by: Dhruva Gole <d-gole@ti.com>
> > Tested-by: Kevin Hilman <khilman@baylibre.com>
> > ---
> > v1->v2: Split the ftrace event into two (psci_domain_idle_(enter|exit))
> >         and rephrase the commit message accordingly. Rebased onto the latest.
> > v2->v3: Add "Reviewed-by: Steven Rostedt"
> > v3->v4: Add the Tested-by label
> > v4->v5: Add "Reviewed-by: Dhruva Gole"
> >
> > Hopefully this patch gets attention from maintainers of
> > drivers/cpuidle/cpuidle-psci.c too.
>
> Lorenzo, Sudeep, Ulf, any comments?
>

Looks good to me. I left it to Ulf, FWIW:

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

