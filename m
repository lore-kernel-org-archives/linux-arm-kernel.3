Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B67CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LITNVwYsu3oS8l/rbSIF4z8H+oLpOrzXSpVP2kU7r8k=; b=RDhgV5d/bK4w+yWjfHM8P8k/9g
	8nW5YLgILfMlrX5toFhvfOLUdgoMYuYkGdeSILQieAA7oeXBhkOZWOP0dS5eeRJ2BqG++HkKLKVNr
	fT72NIfVfDJW3W3zI+HiV9c9wp1i8JaLbyuNaEFPbfTcOfLhm8JBZk4cteg7V3p0J0r/Iznn1AjFS
	TtJqI6z5gVRF1qB7j57PrriJf0YbbHTLlZchS6XYNXBFGLyqN1Uo6gzhP8qUpoNvHz8qb7DwHsEdn
	JEhrHXNS00GznAUc+ASd+8m8iPHKUSNTKu1SmR8urKuhHrS8ZATWH+Ibii9pDE3p5Tx/+D7+ggF/w
	kejGmyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulucE-0000000BpLB-10zN;
	Tue, 12 Aug 2025 19:24:58 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsJC-0000000BUIK-0l1r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 16:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1755016387;
	bh=LITNVwYsu3oS8l/rbSIF4z8H+oLpOrzXSpVP2kU7r8k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RcV+n56//A5TUysROsD7GbH1UfQ2bKozgbi5OYUlMnxswa/FA+2vGCd3rSJaPwyJP
	 bk+elX6ttJIr4JNVohG341E+D0QGpH5wl0/VUYQUfMUxyozSiFtaYp0u5a2RlZLVJb
	 FW2YTV5+geG2g6GeAJzdhQbIYAVyk1s5Dx+d57Qs=
Received: by gentwo.org (Postfix, from userid 1003)
	id 72FA14025D; Tue, 12 Aug 2025 09:33:07 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 72019401EB;
	Tue, 12 Aug 2025 09:33:07 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:33:07 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Jeremy Linton <jeremy.linton@arm.com>
cc: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com, 
    will@kernel.org, patches@amperecomputing.com, 
    Shubhang@os.amperecomputing.com, krzysztof.kozlowski@linaro.org, 
    bjorn.andersson@oss.qualcomm.com, geert+renesas@glider.be, arnd@arndb.de, 
    nm@ti.com, ebiggers@kernel.org, nfraprado@collabora.com, 
    prabhakar.mahadev-lad.rj@bp.renesas.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
In-Reply-To: <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
Message-ID: <cb383a76-8848-44cd-6f32-fd30478d9ebd@gentwo.org>
References: <20250808025533.6422-1-shijie@os.amperecomputing.com> <e47757c3-6091-43b5-ba28-52e11de7d86a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_095710_256478_45CDAF47 
X-CRM114-Status: GOOD (  14.66  )
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

On Mon, 11 Aug 2025, Jeremy Linton wrote:

> From what I've seen, SCHED_CLUSTER seems to be a bit of give and take
> depending on benchmark and machine. I'm not sure if it should be default
> enabled or not, but it would really be nice to have at least a larger sweep of
> benchmarks/machines in order to be sure of the decision.

If the hardware provides a clusterid then I think this clusterid should be
used for the sched domains. CONFIG_SCHED_CLUSTER does that. So it should
be the default.

If there is no cluster information then these domains should not be
created. I think that is already the case?



