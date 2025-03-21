Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC6BC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUggPb1dSqtWKpCSaWvzk+ZaY1JpEPBJvNpui/xayDA=; b=JU0unWdP//PViETYKugqP+JCj3
	hRMPUQ5NfPN+TRsvOaqJXsdpDicYDvyFcu+8HefT5CCaIyVLYdTTGqV/pYdLO6+YY1O0M6dwiB+zy
	D1daEXhbCFr3cvuZFQWRqqWA+Zl1uDphAm6t6cAo6FypMCBHPum5GT4+LECWYP7DewqvE/c127m+F
	YD1kK/E+9BzlsIT/xjHBHuaDsQV8AzAt5j9qD8+bSkoFzCcIwY+ZHVQjYwgH/fh2g28UpkydHkChX
	yqhjOK1Hl7nrApAcADId2u4pkzFWiMTtKHJrKUuZXF99TCD/rpWkqpniJ62W/pXfhpDwe2Si3DEjM
	uSTzJYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcZt-0000000EwsI-0qKd;
	Fri, 21 Mar 2025 13:38:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcWb-0000000EwP8-3NeC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Mar 2025 13:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rUggPb1dSqtWKpCSaWvzk+ZaY1JpEPBJvNpui/xayDA=; b=ELUrWnBzLxbbqKD2/ULkqQpNyQ
	X8Nvl0uOlAWsTIqQFn9WWr7rrMOp16/0PW/zq/2Z9EyXgGgJTv7FCCyJCjDN/KOCBcqJsr99r3RbT
	4kddO58pKnjDY4yRDVp/EYw3sL6Egrwd1+VUU6uDgPA0K/aN/CTrkxkREV251abcAxb5/rB98xZJf
	QDcEt/U1pSU0HjDHpSPbSHOTWcs4wCWK7VNRR0bh+eSnIdNBTr0wW6MkyRp12GlM8Ljjuc/RWjKKz
	aACxFjEWRNwjI7XfrFINxUFMFih/eoSIymEg1qcRMKi04jCzdemeUIT3lGlsKkcx2uWzVjNXbcja/
	QsJ7w3qg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcWY-00000004MPM-2DdD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742564094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUggPb1dSqtWKpCSaWvzk+ZaY1JpEPBJvNpui/xayDA=;
	b=DWPkhnoob/A7ITzSi3Mu7TcHTUy19ohK8GyWa5KnuBUE2Qv5/RdzmbDDV1gVhmlyFl+U2o
	XtYOYklgqIpRxlQhbE84yZ+lT2WfytHk6r8jAwbvWXJ5S2GlTRdgXfWRggD+D9Ce2gYh5V
	t+9ljcyHpNdo4o+eJ6Dgp/PwESoXNBs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742564094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rUggPb1dSqtWKpCSaWvzk+ZaY1JpEPBJvNpui/xayDA=;
	b=DWPkhnoob/A7ITzSi3Mu7TcHTUy19ohK8GyWa5KnuBUE2Qv5/RdzmbDDV1gVhmlyFl+U2o
	XtYOYklgqIpRxlQhbE84yZ+lT2WfytHk6r8jAwbvWXJ5S2GlTRdgXfWRggD+D9Ce2gYh5V
	t+9ljcyHpNdo4o+eJ6Dgp/PwESoXNBs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-ECMoH-jOMhmJiYnN0c7W3g-1; Fri,
 21 Mar 2025 09:34:49 -0400
X-MC-Unique: ECMoH-jOMhmJiYnN0c7W3g-1
X-Mimecast-MFC-AGG-ID: ECMoH-jOMhmJiYnN0c7W3g_1742564086
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D01FB1800EC5;
	Fri, 21 Mar 2025 13:34:44 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.33.60])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 0D4B019560AF;
	Fri, 21 Mar 2025 13:34:35 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 21 Mar 2025 14:34:12 +0100 (CET)
Date: Fri, 21 Mar 2025 14:34:01 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v3 0/3] kernel/events/uprobes: uprobe_write_opcode()
 rewrite
Message-ID: <20250321133401.GB4776@redhat.com>
References: <20250321113713.204682-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321113713.204682-1-david@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_133458_755101_1446E16C 
X-CRM114-Status: GOOD (  12.36  )
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

On 03/21, David Hildenbrand wrote:
>
> Based on mm/unstable.

which has another fix from David in __replace_page() plus the fix from
Tong in uprobe_write_opcode().

So, Andrew, could you take this series as well? Peter, will you agree?

> Currently, uprobe_write_opcode() implements COW-breaking manually, which is
> really far from ideal.

It was never ideal, but today it is simply horrible ;)
Thanks again for your work.

Oleg.


