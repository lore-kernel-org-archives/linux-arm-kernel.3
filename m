Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98CCC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lmEBu63cYbLTK76KGFv2Qip+2pW2SmO02INamDKcgc=; b=1NLWtXVbB1qgdw18TSI8Y3ZnP3
	l28+EtFAOIt9jo4He6Kt79ZXBnsnGpgdjFq2obe+6Wc+sKY/dst5ndhHHrKn8CH8QCHhlFIkJ8qGT
	RLDkPSwrj5jivwOnFxVtHLXPJNjgv0sllw5Hefb4ZG/EJwGfY1I/vI9/6BGHBvnyQhEx3GWKTf/us
	POAPDrDRsFJqZ3HWJYJcRGeL3sGGucZr3QG9ssp+63ercE5tKJjb9gX6bCZ0U6ytiz7dk/0AYTi7x
	YWfjFco/dWPDsFffxcXsGVSmCzjI9UzpBAgI6j/zm1uBq7KYQBCv62oM208GaTgpRxccjJNpu9U3M
	iQHsbU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to107-0000000BArv-1nE8;
	Fri, 28 Feb 2025 14:06:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0yY-0000000BAdZ-1zvQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:04:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AD981515;
	Fri, 28 Feb 2025 06:04:41 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E94613F6A8;
	Fri, 28 Feb 2025 06:04:23 -0800 (PST)
Date: Fri, 28 Feb 2025 14:04:21 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>, saravanak@google.com,
	cristian.marussi@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
Message-ID: <Z8HCZQQLofaiGtpG@bogus>
References: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
 <20250226160945.GA2505223-robh@kernel.org>
 <20250227030924.GB11411@nxa18884-linux>
 <CAL_JsqJOqKeDRuASWxCT=EA5LJbONpCX=Re8=XxKUbPToWy2Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJOqKeDRuASWxCT=EA5LJbONpCX=Re8=XxKUbPToWy2Dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060426_552725_7087CA9E 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, Feb 28, 2025 at 07:34:09AM -0600, Rob Herring wrote:
>
> - The parent driver creates child devices. The child devices can
> either reuse the parent DT node (i.e. set dev.of_node) or just get it
> from the parent device if needed.
>

This is exactly what I was thinking to deal with the issue since this
discussion started. I will give this a go. I believe this must solve
the issue, but I didn't want to spit it out loud until I tried to hack
and check.

--
Regards,
Sudeep

