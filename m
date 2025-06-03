Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA46C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsyA7tNc0e94qj6qio3wOBZShN/xA7ABzjpd8r1yO1E=; b=1DWhknI6g0EBG2Aw3L8N5SJQWc
	fnZy1iBQKJDbGCxJM2YEOUYS2QcNbRoI87LOigQBqjfUVrhtKpBIQBn6IM/OPBOS9fuN/5gGDPyeA
	PLHvNWmFyWGGhhU0JHkWGMzxCXPcNZlrS03uAEXJK+dZofajnDSdgeb31LQqr8510B3NcsUZvy8rG
	B3djWFHedXjmSdUgpXENIVG2N9LKlkEgGLvzjyDbo969iT6Wjz9U83sa7S9YtP4DvjHf4+H7VQPdW
	y3JNJuQBGlY3bomzcaTvv5UJ7QKgFZZX7PoR6TlY4S/XLc7rjPMME2G1gIpz2qtvnRhM5wACE6O8t
	5ojITM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQl2-0000000AvOk-1l8m;
	Tue, 03 Jun 2025 12:28:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQhb-0000000Auaw-1tro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 12:25:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F32812FC;
	Tue,  3 Jun 2025 05:24:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 873033F59E;
	Tue,  3 Jun 2025 05:25:08 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:25:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
Message-ID: <20250603122504.GA8020@e132581.arm.com>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
 <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
 <20250530125944.GB666854@e132581.arm.com>
 <eb7dbabf-d878-468b-9945-36d8b14a4e65@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7dbabf-d878-468b-9945-36d8b14a4e65@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_052511_537925_22E968AD 
X-CRM114-Status: UNSURE (   7.26  )
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

On Tue, Jun 03, 2025 at 11:22:58AM +0800, Yuanfang Zhang wrote:

[...]

> Using both dynamic and self-contained IDs within the same system can result in ID conflicts, which may cause decoding failures.

If so, please follow up Suzuki's suggestion to expose Sysfs interface
in TNOC device node.

Leo

