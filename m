Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2361F5513F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 12:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgjlFQoig214Pd72eeEks0kUm4IG4yWIBIp8UV7HIP8=; b=gGduoF4D2PTNcF8AkXOnlJG7uL
	xk6SIBelmQHYBE6+dloyD9ZUnSZnSn/NrbfRCYDr0Qbked9cxBANGe71sAa3KMPEs8k4TiOdsdIhP
	/tfi65Lopn3e+GJrI2pggRmpQVwZp5UTPKrjEm9osdNLwvhIeBSbfT5jNFF98lrVHji0TuvTJ8ofr
	pr2WlWA8B9Td9UpXJCVsj5q5jctVg9amPQZv1cHJsLQK7fCPrfzg3cKznCVifk3ERgqHlbDwmq2ZU
	CBHX5ZgNKKPqfSSRb2qSXhl68YOeeTJYYvUEomE8OecryAqwjqIK7PbrWhjMpwx3pxBPPnGQe9pq2
	2T0AP8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDht-000000062Gr-2ErL;
	Sun, 08 Mar 2026 12:58:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDhs-000000062Gj-2px5
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 08 Mar 2026 12:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pgjlFQoig214Pd72eeEks0kUm4IG4yWIBIp8UV7HIP8=; b=SHWs9cRCgCkgwGUhG8GK5r4vaQ
	3+09tEumkTxd3wWyImVx73teSoFSJ+/OXuh8qBGgc1khRBEavtssgKlMPI7fcnnHyL0yVq8giJZgp
	WG8YrRF8OG7AXoWR/FUcJLvUPNFwcesNSkPVZO60ZZa2NJaZvy/bL23LXpvm7Irs5R8F820Fdhbor
	RIlU8hYfa7wFc8PHQDAv1Po8Oam25KaZWsOFm5OMJOGT2HKw2JxllAlxH9IscajxWsTTmU4pjIFl+
	VAxSZswmSBotmCYKau1XmHeEYH3OTL5GPE1/v8GNH8FOMI+bOPygO87oTH/10SivBppdZCsLBrKEj
	NlsIf8uA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDhp-0000000Av53-21hw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 12:58:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C11840163;
	Sun,  8 Mar 2026 12:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17629C116C6;
	Sun,  8 Mar 2026 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772974674;
	bh=qmerQN/MNFLleJjYoj2ghmUyJS/la0Y4En0Gjn2rpY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YE7i7Do6PwV0OjY9PQBqV7fBMsfuno9wQwaJzINRw/vBh+USU/V+a/xl4BRnWudNz
	 SQV9dgD2E2V5W65fgJFmX1aTySb0uZr/G8J+V/VgCINuAmzPKoWpPTIsuu7D02ijmp
	 fe4zle+Zv13vqlwYDxKAInufA1FwnhCKO3Cv001T2knPUSJHZLY4LETmIccmUrGnW9
	 ATCUa55rkjhtfvAHhA2xFBWgmrXg8wlapgpQhbEi6hClXs+9ZsQstPiBvadMh0pgDr
	 pbXrj3anI2ER7pDLWmjpFacg9tQ+CXWZkg+lefWT717gg6j7reoVxbMBtlGYPL7e71
	 W9PWo04UWqefw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Felix Gu <ustc.gu@gmail.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_scpi: Fix device_node reference leak in scpi_probe()
Date: Sun,  8 Mar 2026 12:57:46 +0000
Message-ID: <177297460000.1087540.1235389041649410289.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121-arm_scpi_2-v2-1-702d7fa84acb@gmail.com>
References: <20260121-arm_scpi_2-v2-1-702d7fa84acb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_125801_839706_59EC5344 
X-CRM114-Status: UNSURE (   8.38  )
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

On Wed, 21 Jan 2026 21:08:19 +0800, Felix Gu wrote:
> In scpi_probe(), if of_match_node() fails and the function returns
> early, the shmem reference is not released.
> Use __free(device_node) scope-based cleanup to automatically release
> the reference when the variable goes out of scope.
> 
> 

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!


[1/1] firmware: arm_scpi: Fix device_node reference leak in scpi_probe()
      https://git.kernel.org/sudeep.holla/c/879c001afbac

--
Regards,
Sudeep


