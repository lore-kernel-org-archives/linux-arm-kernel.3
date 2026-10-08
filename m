Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42232CA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=i1jO+LCEPMTKc10Ny2dhCy81d8
	Z0rJC0JBgJSY1tPgqlhHAOBLoCt5ddnDHEe+Bs97nwF1zbH4HO6moTJpt0uFbyJFH+cdOItL+p3Gq
	3FWa+LuHcSHuWyFRoM2pYh6ek8+eaXIhu55g3+EqftRSERcJ4HFTPOvTkQDsv6Pl+I5pLAUeuZgAH
	87EVAbGUaeLRTLinLM2+ciVUpt5jzE7PYECDqqFn7olHZrj1YNcW63KWd2SNsHb04ESkmS1uBgrgz
	UgJEeduArgR7YIF/Np3tRFHBACK51RhgBHVb/Dkx/KN8t2wkUSaZJaf5v/qdD8voHzLTx07e7KOGq
	w5ZFbY/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkqo-000000042mi-33DY;
	Thu, 08 Oct 2026 09:55:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkqn-000000042mT-1rIq;
	Thu, 08 Oct 2026 09:55:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B9B406E0;
	Thu,  8 Oct 2026 09:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDD41F000FF;
	Thu,  8 Oct 2026 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791453344;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cLJk25pfjK0jW/iM6wA3vmuLAWxdTGXQT1dJ2Khqb8OKP5y36Y7LzvndtAiUnILOt
	 OniL/RummSSbUFz0BffvsM3jFbgV4LUCnsf28WQh7V8OD6DYEIS47C5tI1OSIbFmZs
	 qOxP84q77T1qMA6VD8zSCzV6hZYwwr2ZkCPuZXg0MJb8YqK0/EVpNffWRpdDcHDJjL
	 DcAJAE8OWFUiK8W1lD5KyK4vq98qffNDWUNzRjdCYVk9wyRlx3+M6f8vf45EzH7BLe
	 BFLB9z6TqZFytHF3rRetER0/THvTNS8jo01VBbFJMWthm7fLTrjL/AK+lsQUJdeVDP
	 NjEoZV9I3PDgw==
From: netdev-bot+sinfo@kernel.org
To: SAYANTAN NANDY <sayantann11@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bread.hsu@airoha.com, sayantan.nandy@airoha.com
Subject: Re: [PATCH net] net: airoha: keep PPE offload when NPU refuses flow stats
Date: Thu, 08 Oct 2026 09:55:43 +0000
Message-ID: <179145334384.2527009.4239067700016804590@kernel.org>
In-Reply-To: <20261008094828.15458-1-sayantann11@gmail.com>
References: <20261008094828.15458-1-sayantann11@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

