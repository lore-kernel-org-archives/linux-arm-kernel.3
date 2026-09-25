Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AECC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnp5HOIGcAOyxCzrPOE4p3KTTNVywfZTwHRYxevT9oE=; b=W0cN4HKVT8jZ+0m9Z9+bPI/uXC
	ac65eLeg+97ThC4ZlynFLG8YHEndR8Kul3vxCWnw29h01QoGLrcHTxWLiEtzrNErQdAxBUF+g9ZHC
	REushh84U6MUkStDag38na4SGsgb8kdAu2feRffsSbUYCuwtu6+7NABAjssD7NReqf7Xnyq+T9wcw
	1rC54/9oQ08QLflLUmPPgfsxlGWV34inpwWlEtmhoaZkd9GfeuJP1156LH0Bk1NrHGParTBxPWmtA
	Pk46zWU+II8iPTw6GqyCx75tdO2h3lx9EOshVjrBSvjlAA1nC20UnE+J66SxC+STd9SBs4+mHIF6i
	yDDa2JQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5re-0000000DPh5-3hE8;
	Fri, 25 Sep 2026 13:21:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5rd-0000000DPgs-3OlA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:21:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CDBD43C58;
	Fri, 25 Sep 2026 13:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9D81F0089B;
	Fri, 25 Sep 2026 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790342481;
	bh=nnp5HOIGcAOyxCzrPOE4p3KTTNVywfZTwHRYxevT9oE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=dCEHQwIHAhEiqlOSbrZQu1HXQa1FLHFwqHzuiaWNdDfpkRC64TjVFIdlfmQ/cC1Xe
	 5/x7z6b78oA85nUYJkhhVWS8m7YVDRuF8VMGX+8rwe32893U/G2wwb4Y0raywMihfY
	 FTeKUBoSvQwQwCb+PMrEZFm//AxI2wvrke2D1l3xxKdY5LrTNr2Suhx+Xqj+OTVLjH
	 ycPe7hVFy37MVF57XMF8NkRxN/ghC464JDgmpjISx3NNYF/evQVOporj48duNi9wkl
	 9mfXhpdqEscNELl29xOugeHUUc3HBRLwK3gf2yuMp5dJ4raF5w/jWI5qKVikGOYQJj
	 dbAzFpt36ROMA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A368B198005A;
	Fri, 25 Sep 2026 09:21:17 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 25 Sep 2026 09:21:17 -0400
X-ME-Sender: <xms:SHW2aktaus6bb3IDuwehy0tHmweKqR04JpLaMh72_iSOaPlqzXvfjQ>
    <xme:SHW2asSnKpWQ-r8xqObdC2hSfp-2imDbKVp5NBJuyfgOSvio4fGmEOyM5nQ9ahFsn
    kqOeUq5fxXXYI5iD6Y_2CQ5nw40e37Is80LXaS-sAhalrV-DLrdURsk>
X-ME-Proxy-Cause: dmFkZTGm//tvmOX7B1Z6aN22M5G/NImGiJI5CG+zWqb2Cz5VW2X9+opF+vwz1PFhssRYty
    oD8XLhwfOFQeDBAu0BJPFbOMXjR8yUQo3h6q/OacKqpkU0GkT9Plok53rbQqbjW3fcguac
    PFdoO4I+6Si4H1xddpnS0WdVtz3WxK8NoXh8W2ru9lYH925szGXJjXx3Y+vB4izliBqDc+
    J1ni3rDNHLoAHy+nSwmI7gwEkj85FUw4B/aFanwVvYpsZBAaCygwrpKO9P9m45bmAZJLrD
    IJDwKb6eb1YdHlf6/5vjdaV2WvJTzeZLEugQPszF1ilewRcazFfoDb+r1OV6+YI9SmRMJg
    punkHkfINQz5IsX9htKb+bV85phrVMj3lY2al1xwQs997rDo15yxZfcBBoQwE5h/etuk0Q
    nqMv8To7cMP5rPdvrcccT5GG+1mY0sC5o8vka5eieW4pZ6HyCnqc3r/mX/WGMGmAWlu7TY
    FCTQnFBks8dPu0cUVM3LZv3/ULJLlsa0QPLsBPxssiLh4T+spgXVbzKrpqM5xPZoKD2AWW
    53sHXPvAERtyW/YFkqdqVkA20ADoFtRf6jfgl+6TgGI6dwIiT0zxjXHEHDKbBEBkL9MLdx
    GjfkR3sbyYPnN7CeuGYvFBSUCxcnTRuwR9qzQWhUUUMfK0KXvALVLTj9CJOw
X-ME-Proxy: <xmx:TXW2aoFGG9loSWBbU31zJMbvMsmadwoE-lf0L6goyRTRjs2sMswMwg>
    <xmx:TXW2ahQsQs7GlhxzxyfMH8kbES1Gm9RO1OqkFbvawwTGnlRkN_fS4w>
    <xmx:TXW2atvaN1CUhzVQloD2COOrpG08nOOHR7XsZMzf6Eq6Y4J5b8EsNw>
    <xmx:TXW2avBFFV8S5v5cD7WUgwOyDYfNJ0TZUkcRgUm-E5DU7gWWxkwD7A>
    <xmx:TXW2an0LHs8XQNJAz7oOEnt22V-eLS5U9yMpLvFpPM292dcPHo1nbyYl>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 622AEF80086; Fri, 25 Sep 2026 09:21:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 25 Sep 2026 15:20:51 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Cameron" <jonathan.cameron@oss.qualcomm.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "David Sterba" <dsterba@suse.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Mark Rutland" <mark.rutland@arm.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Simon Glass" <sjg@chromium.org>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Nick Terrell" <terrelln@fb.com>, "Will Deacon" <will@kernel.org>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>,
 "Conor Dooley" <conor.dooley@microchip.com>,
 linux-integrity@vger.kernel.org, "Palmer Dabbelt" <palmer@rivosinc.com>,
 patches@lists.linux.dev, "Ross Philipson" <ross.philipson@gmail.com>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Song Shuai" <songshuaishuai@tinylab.org>
Message-Id: <ee493585-e685-4616-945f-9d1daae0667f@app.fastmail.com>
In-Reply-To: <20260925125945.GN9354@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
 <3-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
 <20260924154902.0000528b@oss.qualcomm.com> <20260925125945.GN9354@nvidia.com>
Subject: Re: [PATCH 03/16] efi/libstub: Free cmdline_ptr in efi_pe_entry
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Fri, 25 Sep 2026, at 14:59, Jason Gunthorpe wrote:
> On Thu, Sep 24, 2026 at 03:49:02PM -0700, Jonathan Cameron wrote:
>> On Thu, 24 Sep 2026 10:53:06 -0300
>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>> 
>> > Sashiko points out that efi_handle_cmdline() allocates this memory and
>> > hands it over to the caller. If efi_pe_entry() ever returns it should be
>> > freed. Add a __free annotation.
>> > 
>> > Fixes: 42c8ea3dca09 ("efi: libstub: Factor out EFI stub entrypoint into separate file")
>> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>> > ---
>> >  drivers/firmware/efi/libstub/efi-stub-entry.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > 
>> > diff --git a/drivers/firmware/efi/libstub/efi-stub-entry.c b/drivers/firmware/efi/libstub/efi-stub-entry.c
>> > index aa85e910fe595e..83fade2b0d3b84 100644
>> > --- a/drivers/firmware/efi/libstub/efi-stub-entry.c
>> > +++ b/drivers/firmware/efi/libstub/efi-stub-entry.c
>> > @@ -40,7 +40,7 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>> >  	unsigned long image_addr;
>> >  	unsigned long image_size = 0;
>> >  	/* addr/point and size pairs for memory management*/
>> > -	char *cmdline_ptr = NULL;
>> > +	char *cmdline_ptr __free(efi_pool) = NULL;
>> 
>> Can we move this down to just above the call to efi_handle_cmdline that
>> does the constructor side of this?
>> 
>> I see none of the efi stuff follow those guidance note that went in
>> cleanup.h.
>

My bad. Patches welcome.


> Yeah, I stuck with what was there.. It looks kind of weird that way:
>
> 	char *cmdline_ptr __free(efi_pool) = NULL;
> 	status = efi_handle_cmdline(image, &cmdline_ptr);
> 	if (status != EFI_SUCCESS)
> 		return status;
>

That looks fine, no?

