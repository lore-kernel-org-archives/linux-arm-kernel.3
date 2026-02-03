Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E453E83059
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 06:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMRJYUFZspHnxLu+LC/ZJN4xOqd6zE3i2hTsVolBFMY=; b=MkhuRRmGJLulWfQiMdlYdPYaXa
	w18HS/MtoKVXH3kBp29NLv8vHAqAzrh8gZeX73ySXFV7aUW+GpLSwJ++76PcsBwj2Vw7dqG6Of4wj
	lBbxzGCn3QbQiejagBHKAatqztb7f5gEy14yECrlOXy2G0bNkSGCOSyv1iW0M6dpZsUWJQkjXipx1
	BnZrPWusmb9gv2cVAGZsgT7ZxOXAhsspF0VGTx4YN53PeGHEWc/OvxQn9UHwnw6w8DP1yzKVDJmW8
	t/ZDVXPsESi3RKtgPh7UqVIPBbyb3rKTofeksuWdZ60tCeGInZut5gQiq4wJE0YDGrLn6N41g/OTo
	PPcs1NhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9uN-00000006BkK-3brT;
	Tue, 03 Feb 2026 06:29:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9uM-00000006Bk8-318B
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Feb 2026 06:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qMRJYUFZspHnxLu+LC/ZJN4xOqd6zE3i2hTsVolBFMY=; b=BNM6rivEVw3Pp4k6fI/ZwXk/bm
	Ctffxp9JPKWGg3HPf58UlIzuZIHw5krlXUk6AUxypiT0iW8HcI2js0bWYMcd+BCoB39A8jUu2NeZv
	3vQ6jvGmT3yJL90TSlaVZj7XlXhThoXnFsupJrF9XrGYldXYKWQmUlAct3GAS+MhL+gZ9/KOhYuND
	O7rDtovmzSigdMBWXVdtKSt02S8jMqF84+QlLEh9hGz1MfqZTr5xyrZTZ1Puv4ZXLvRe+VjVm168v
	cpSKCcJdjpRBufBztdng+KRdIhw+sx/kSQajUemMnbACkhmXmUz1k6PGmuVvd3a0RZcP/u6jR1YQ3
	C4FNxYJA==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9uJ-0000000FiFh-0vCa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 06:29:05 +0000
Received: from [10.95.64.228] (unknown [167.220.238.132])
	by linux.microsoft.com (Postfix) with ESMTPSA id D921E20B7169;
	Mon,  2 Feb 2026 22:28:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D921E20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770100139;
	bh=qMRJYUFZspHnxLu+LC/ZJN4xOqd6zE3i2hTsVolBFMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PHBOq8UijOdSljRE5R6MqpGKaF/+hnU/3EJUTHWsSZKbvYtCdUkiP7shsnh7Tef40
	 tYx793xDPbR0b0SHUSv+6SxpSh+BwnjFXYzx/polksIplQPcAH4m063yLgSlfkcPs8
	 apRAeR1gXnXKxrtQtiDlfJi8bsSug+HDzKMYVpOA=
Message-ID: <cd0e4ca5-542c-42db-bd7c-c63f5df85fc5@linux.microsoft.com>
Date: Tue, 3 Feb 2026 11:58:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] kbuild: Make --build-id linker flag configurable
To: Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
 <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
 <20260202231508.GB2319189@ax162>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <20260202231508.GB2319189@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_062903_624302_B069CFB2 
X-CRM114-Status: GOOD (  20.03  )
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



On 2/3/2026 4:45 AM, Nathan Chancellor wrote:
> On Mon, Feb 02, 2026 at 03:15:30PM +0100, Thomas Weißschuh wrote:
>> On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
>>> I am trying to implement reproducible builds for one of my product
>>> kernel. I referred https://reproducible-builds.org/docs/build-path/
>>> and tried to use both -fdebug-prefix-map=OLD=NEW and
>>> -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
>>> binary reproducibility without overwriting build-id to none.
>>> If I move the kernel to same path in other setup, I was able to create
>>> same binary hash, however, without it, there is some difference in
>>> build-id hash values.
>>
>> Can you force the same build path during package building?
>> That should avoid this issue.
> 
> Yeah, I think that it would be better to document this in
> Documentation/kbuild/reproducible-builds.rst, as opposed to adding a
> hack to disable the build ID altogether. It seems easy enough to make
> the paths consistent between machines and environments by using a
> container or such. The new scripts/container in -next could help there.
> 
> Cheers,
> Nathan

Thank you Nathan for your inputs.

I'll plan to ensure same path for my kernel build, and send a patch to 
add this in reproducible builds documentation.

--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -58,6 +58,9 @@ to an absolute filename in an out-of-tree build. 
Kbuild automatically
  uses the ``-fmacro-prefix-map`` option to prevent this, if it is
  supported.

+If it still does not work, ensure that the kernel is built in the same
+directory, using containers or such.
+
  The Reproducible Builds web site has more information about these
  `prefix-map options`_.



Regards,
Naman

