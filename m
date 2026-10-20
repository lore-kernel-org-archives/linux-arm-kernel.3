Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDFD606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H7R7a8fo;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=EhUxWptS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwvR0hqKgY0QppCDRqvS4E1+yFhDfD+NCtMbvNXlcGU=; b=H7R7a8fobqTx9cA6s70XpaxC+K
	KguB6KPb07msZm2Hs54HGwvlr4E7V2EMf8jNIjZBgARIyemO2r7+evkZgJ/B4SRPB0uEr3LNPGON8
	b2DwVVQUs+6l3QYrcrL50debFpv9RvhUao69F9McSgT8dQVJfSwCxtxzzCTCpuFzoCATIeIYyoLpw
	epZDxIDySnUoc9JviXw95yv/oAdWDZskp5yt+hUYHn6tgt1FrhKJs3DMdhbJWXUBnk48rKm+eRudb
	vw6uaskd5qgElRiM/vh4BTsB0nTUgO9ortX/fiN9vTotx7QcEx9nrKSXKl/VlBsCQFFVRUmFeyzVH
	xxiqyu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEmj-0000000ATNT-1v7i;
	Tue, 20 Oct 2026 18:42:05 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEmh-0000000ATMm-04WK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 18:42:04 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-35b2c599f43so1375963eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 11:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792521721; cv=none;
        d=google.com; s=arc-20260327;
        b=fdzMk1k7gygeoIjzDY7nS06lkk1ucCeqrcBIO115wFOkpaR/qx4RRNb4YKd0yZ8EgL
         U+lDBLO7EIyUZANZ1rTPgKksKLvzZKFKgguungh1bavFJL5Y/HTIgiZwiqnI1hTjYCom
         pZodENOS/Klcxo0ByYUTyOnD7+C2vjLMnF+KQhP/+HkvSFG61uekZyAq6WnhGWKH5nFT
         86+UlqVODCXa5AiwZilTq0r3SzkySE9de/mSZj/mjw/yrHisIyEx9oibp9vVwsArX+jQ
         Lv5AJ5WnQcQqBAhbR/S0HhoBAPPfeYU4M7X9N5noPKySHXo8qvqUjcDymrs8nUkvNu2D
         8gwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YwvR0hqKgY0QppCDRqvS4E1+yFhDfD+NCtMbvNXlcGU=;
        fh=yiafHe8n7Y+XbdqV5UPc7T1BLOGSNBA44lFTLDI4ffU=;
        b=Im0LoqWE+0fdz6shDtEu7ej//Bn6tx36i4rWLoRB3HDxJIeIMacqeC8hjtLT6joEct
         rjbJeNOIJpjJN5ALMfzm0QiZRqjKckN/29iZ0R3ioXPhKdThp56gT7nacXizD8Pji/28
         o5OBrGag+JYg2jBPL3LPUkamBudRRaTpzVfTf7LnXhPwODo5o7e5T9oiHzFnEFtPNxPR
         t2H2FI/jzualeT7L2YmpM4ENUz1R5mcFbT8GP/+wDUcHDOJYfXES0eZaHvjM5G7Txh5B
         7c+JVFwWqySsOV8czRX4PE7XLYVq5PmAJO3kWdJ1AkJ/37Zq9yPvObVdbqzQZwJbSIxc
         3iew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792521721; x=1793126521; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwvR0hqKgY0QppCDRqvS4E1+yFhDfD+NCtMbvNXlcGU=;
        b=EhUxWptSzXFq/GU/aKEbmGTTsGCyWnJUFdZLHevPssfk/8F8vFyVHPpfTnWwxy93md
         H3v655N26yVimHnacqPy8MyG8lqHatnUYfNJ5elm7hfZqYtJ8JzJxe5SwHnFxV/F9jIY
         5sNNC2sIG8PQV5mLbQhCHxvqloHmKkq+CncHHQr7ABJTQOFtaPK9X7bS+1WIpuCktago
         nBt6k6K5Lhp2P7/KE6ix7M67XUfu3UJ6huvI2f0zZrxZiYQrAOmaP77Q/TqeTycxPy6H
         yPGDEMC9RumnDhZzqjMPPhp54Ii6yytDfEDBHkQpqC8lH69eCIWqOpvxMdSAUPWYoDtn
         yLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792521721; x=1793126521;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YwvR0hqKgY0QppCDRqvS4E1+yFhDfD+NCtMbvNXlcGU=;
        b=vltHz4DPHAvPXysiVQp48aUjvrxmPb1XUjMxpcAdlkVIi9tDNWgSGl3D8G9rvoeT3T
         X2bE+fc+NVwaYHW1aE4Y5tSSypjTatM0MvOMMhZ44P69BbDoeM2P85CY3ZiHadIaPy8I
         9OtQXk10HcYsqktfpRNdJJ4NP7caufCrx5QB3Re6e3nxzZoreoGdLuaS+FkXusw4Trir
         inKj/4nXPQG/MBD+QYLwz4JGsEH2KcL7AeYWpJDnrZLXCaGkUkDaEsLw1q0JJDGxFxJx
         QwhkYk3/aXBzDY6jNPeclAV9kjoaDrGxBwxnTBDdY5O1WAuFwswZsAPY8+7ZpPTBgP09
         aB1Q==
X-Gm-Message-State: AFq9FYLwPiG0fwp2QpqtuZIC5AilVxK0l8cm6+7lB1lzW17R4KfO9lEu
	+N6Po/c6O/dSdgof+8UgBH/s3RR0njy829JmtIyA10gWQoBD3vAgOcVU/IaJt/byAKsYRVpHS1P
	GyNio3+VCkibNY7+AjPwI9uxw2F4dy4D0L9fdL8Z8TA==
X-Gm-Gg: AYBFou2CoB7SsVe1zi1TGgIwbzrDG3K9GS5fJue6ztMJ861+5if2k3goSEX30IGNP3k
	rdpjU84DcOra/MDCDqbdDOe94Xlvrc6oQCrFJr+XwOYuSCGR8totsZQq//gAC++iRSo0Cee01z8
	hNWkIb4zhnKdJCc/KYu87xOCkTbFFyb/m+60RbIL/gFc/aF3ofLws0OyG4GnYwexki0l603GxD1
	sj2ENpkXl+hvKFkkP8assFaaCSvEzg15nUI8NywMTh6ZTVBDuqZuIz8QIT+3eDoSg/P7sPLgOt7
	WyumkFn7FoOh0otl/c2rQq0IAwq3WDZdvtmVmwePpDUJLlEHFzHfFEHtqA==
X-Received: by 2002:a05:7300:c00e:10b0:35b:d329:9f3e with SMTP id
 5a478bee46e88-3674e842a86mr135963eec.28.1792521721089; Tue, 20 Oct 2026
 11:42:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai>
In-Reply-To: <20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai>
From: Siddarth Chilukuri <siddarth@nexthop.ai>
Date: Tue, 20 Oct 2026 11:41:50 -0700
X-Gm-Features: AclHuK9vLMZF-AAKuV86zplYxOP7GeZc2vlcY3CCw4_yPy_9puJFU1MY3JTp13I
Message-ID: <CABAykku7MDTF7jTg3OdY=AWCqrBUTS_sNAoVTHUBM6yM=NKjUw@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: don't fail a read whose data is already in the
 RX FIFO
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_114203_066426_DBE88FCA 
X-CRM114-Status: GOOD (  10.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 5, 2026 at 11:49 AM Siddarth Chilukuri via B4 Relay
<devnull+siddarth.nexthop.ai@kernel.org> wrote:
> When the controller is the master receiver, TX_ERROR is set once the
> core has NACKed the last byte ("transmit complete" in PG090). We have
> [...]

Hi Andi, Michal,

Gentle ping on this one. We've been carrying it on our Xilinx AXI IIC
based switches and it fixes the spurious read failures described in
the commit message. Happy to rework it if anything needs changing.

Thanks,
Siddarth

